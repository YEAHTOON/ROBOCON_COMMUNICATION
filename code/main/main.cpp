#include "uart.hpp"
#include "pthread.h"
#include "semaphore.h"
#include "stdio.h"
#include "tcp.hpp"
#include <errno.h>


//模块数
#define MODULE_COUNT 1

//包头包尾
#define HEAD1 'n'
#define HEAD2 'i'
#define TAIL1 'a'
#define TAIL2 'o'

//串口锁
pthread_mutex_t uart_mutex;

//tcp协议的管理者集合，不为nullptr说明对应的模块已连接
TCP_CommunicationManager *tcp_c_ms[2] = {nullptr, nullptr};


/**
 * 
 * 串口读取数据并传给模块
 * 
*/
#define LIDAR_ID 0x01
#define YOLO_ID 'h'
typedef struct
{
    uart *u;
} GetInfo_From_Uart_Args;
void *GetInfo_From_Uart(void *args_void)
{
    //输入的参数
    GetInfo_From_Uart_Args *args = (GetInfo_From_Uart_Args *)args_void;

    //设置解码器
    Decoding_ReceivedUartPack d(HEAD1, HEAD2, TAIL1, TAIL2);
    uint8_t d_buff[128] = {0};       //解码器得到的结果

    while(1)
    {
        //将串口读到的数据传入解码器，如果无数据会阻塞
        //成功解码后进入if内的程序
        if(d.input(args->u->uartRead()))
        {
            d.GetData(d_buff);      //存入结果
            printf("uart get : %s\n", d_buff);

            if((d_buff[0] == LIDAR_ID)&&(tcp_c_ms[0] != nullptr))       //对雷达的命令
            {
                tcp_c_ms[0]->Send(d_buff+1, strlen((char *)d_buff)-1);
            }
            else if((d_buff[0] == YOLO_ID)&&(tcp_c_ms[1] != nullptr))
            {
                tcp_c_ms[1]->Send(d_buff+1, strlen((char *)d_buff)-1);
            }

            memset(d_buff, 0, 128);
            d.clean_data();         //清理解码器内的数据
        }
    }
}


/**
 * 模块发送数据给主控
*/
typedef struct 
{
    TCP_CommunicationManager *tcp_c_m;
    uart *u;
    int tcp_type;
} SendInfo_To_Master_Args;
void *SendInfo_To_Master(void *args_void)
{
    SendInfo_To_Master_Args *args = (SendInfo_To_Master_Args *)args_void;
    uint8_t buff[128] = {0};

    while(1)
    {
        //接收tcp消息
        args->tcp_c_m->Recv(buff, 128);
        printf("tcp get: %s\n", buff);

        //已经断开了，解除套接字
        if(strlen((char *)buff) == 0) 
        {
            //是雷达
            if(args->tcp_type == 0)
            {
                tcp_c_ms[0] = nullptr;
            }
            //是yolo
            else if(args->tcp_type == 1)
            {
                tcp_c_ms[1] = nullptr;
            }

            pthread_exit(NULL);
        }

        //发送串口消息
        pthread_mutex_lock(&uart_mutex);
        args->u->send(buff, strlen((char *)buff));
        pthread_mutex_unlock(&uart_mutex);

        //重置缓冲区
        memset(buff, 0, 128);
    }
}


/**
 * 
 * 创建与其他模块交流线程们的线程
 * 
*/
pthread_t uart_threadID;                        //接收串口数据线程
pthread_t com_threadsID[2] = {0};               //交流模块的线程们id
int started[2] = {0};                           //是不是第一次进入线程启动判断
int existed[2] = {0};                           //判断线程是否存在
void *create_other_communications(void *args_void)
{  
    //创建接收串口消息的线程
    GetInfo_From_Uart_Args *GetInfo_From_Uart_args= new GetInfo_From_Uart_Args;
    GetInfo_From_Uart_args->u = (uart *)args_void;
    pthread_create(&uart_threadID, NULL, GetInfo_From_Uart, GetInfo_From_Uart_args);

    //启动TCP线程的函数模型
    auto start_tcp_thread = [&](int typejudge)
    {
        SendInfo_To_Master_Args *args = new SendInfo_To_Master_Args;
        args->tcp_c_m = tcp_c_ms[typejudge];
        args->u = (uart *)args_void;
        args->tcp_type = typejudge;
        pthread_create(com_threadsID+typejudge, NULL, SendInfo_To_Master, args);
    };

    auto judgestart = [&](int typejudge)
    {
        //线程没开始过，这是第一次
        if(!started[typejudge])
        {
            //启动判断，要求有tcp连接
            if(tcp_c_ms[typejudge] != nullptr)
            {
                start_tcp_thread(typejudge);    //启动线程
                existed[typejudge] = 1;         //存在过了
            }
        }

        //已经开始过一次，能判断线程是否死了
        else
        {
            int exist = pthread_kill(com_threadsID[typejudge], 0);      //线程死否

            //启动判断
            if((tcp_c_ms[typejudge] != nullptr)&&(exist == ESRCH))        //既要有连接的tcp，也要求线程已死
            {
                start_tcp_thread(typejudge);    //启动线程
            }
        }
    };

    while(1)
    {
        judgestart(0);      //判断雷达
        judgestart(1);      //判断yolo
        sleep(1);
    }
}


//主函数
int main(void)
{
    //锁的初始化
    pthread_mutex_init(&uart_mutex, nullptr);

    //串口初始化
    uart u("/dev/ttyUSB0", B115200);
    u.setparam();
    
    //创建套接字开始监听本地
    Addr localAddr((char *)"127.0.0.1", 30000);
    int LocalSocket = yzt_tcp::getBindSocket(localAddr);    //与本地地址相绑定的套接字
    TCP_ListenManager tcp_listen_m(LocalSocket);            //建立监听套接字管理者
    tcp_listen_m.Listen();                                  //监听开始

    //建立全部的TCP连接
    pthread_t create_other_communications_id;
    pthread_create(&create_other_communications_id, NULL, create_other_communications, &u);
    while(1)        //循环获得每一次申请的连接的套接字
    {
        //同意连接，获得连接后的套接字号
        int socketNum = tcp_listen_m.Accept();

        //获得确认信息
        char sure[128] = {0};
        recv(socketNum, sure, 128, MSG_WAITFORONE);
        sleep(1);
        
        //是tcp另一端雷达的确认信息
        if(strstr(sure, "lidar"))
        {
            //已经有连接的线程了，直接中断连接
            if(tcp_c_ms[0] != nullptr){
                close(socketNum);
            }
            //否则将新连接加入存在数组
            else{
                tcp_c_ms[0] = new TCP_CommunicationManager(socketNum);
            }
        }
        //是yolo的端口号
        else if(strstr(sure, "yolo"))
        {
            //已经有连接的线程了，直接中断连接
            if(tcp_c_ms[1] != nullptr){
                close(socketNum);
            }
            //否则将新连接加入存在数组
            else{
                tcp_c_ms[1] = new TCP_CommunicationManager(socketNum);
            }
        }

        //无效的端口号
        else
        {
            close(socketNum);
        }
    }
}
