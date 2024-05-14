#include "tcp.hpp"
#include <iostream>
#include "log.hpp"
#include <pthread.h>

pthread_mutex_t mutex;
yzt_log *lfp;
int socketList;

void CleanUpFunc(int sig_num)
{
    close(socketList);

    printf("Program exit via signal function!\n");
    exit(1);
}

void *getInfo(void *args)
{
    TCP_CommunicationManager *tcm = (TCP_CommunicationManager *)args;

    char buff[128] = {0};
    while(1)
    {
        tcm->Recv(buff, 128);
        if(strlen(buff) == 0) continue;
        *lfp << buff;
        memset(buff, 0, 128);
    }
}

int main(int argc, char *argv[])
{
    pthread_mutex_init(&mutex, NULL);
    yzt_log a("cli2.txt", "cli2", &mutex);
    lfp = &a;

    signal(SIGINT, CleanUpFunc);

    // std::cout << "start" << std::endl;

    Addr serverAddr((char *)"127.0.0.1", 30000), clientAddr((char *)"127.0.0.1", atoi(argv[1]));
    int socketNum = socket(AF_INET, SOCK_STREAM, 0);
    // close(socketNum);
    // socketNum = socket(AF_INET, SOCK_STREAM, 0);
    // int socketNum = yzt_tcp::getBindSocket(clientAddr);
    socketList = socketNum;
    TCP_CommunicationManager tcp_com_m(socketNum);
    yzt_tcp::connectToServer(serverAddr, tcp_com_m.getSocket());
    const char *sure = "lidar";
    tcp_com_m.Send((void *)sure, strlen(sure));

    pthread_t pid;
    pthread_create(&pid, NULL, getInfo, &tcp_com_m);

    char buff[128] = {0};
    const char *data = "x:12.8,";
    uint8_t dataToSend[12];
    dataToSend[0] = 11;
    dataToSend[1] = 0x5a;
    dataToSend[2] = 0xee;
    dataToSend[3] = 0x02;
    dataToSend[9] = 0x67;
    dataToSend[10] = 0xff;
    dataToSend[11] = 0xa5;
    dataToSend[4] = 'M';
    dataToSend[5] = 'O';
    dataToSend[6] = short(53) >> 8;
    dataToSend[7] = short(53) & 0xff;
    dataToSend[8] = 3;
    while(1)
    {
        // const char *b = "nihasdafao";
        tcp_com_m.Send((void *)dataToSend, 12);
        sleep(1);
        memset(buff, 0, 128);
    }

    // while(1)
    // {
    //     sleep(1);
    // }

    return 0;
}
