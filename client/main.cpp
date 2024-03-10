#include "tcp.hpp"

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
        tcm->Recv(buff,128);
        printf("%s\n", buff);
        memset(buff, 0, 128);
    }
}

int main(int argc, char *argv[])
{
    signal(SIGINT, CleanUpFunc);

    Addr serverAddr((char *)"127.0.0.1", 30000), clientAddr((char *)"127.0.0.1", atoi(argv[1]));
    // int socketNum = socket(AF_INET, SOCK_STREAM, 0);
    int socketNum = yzt_tcp::getBindSocket(clientAddr);
    socketList = socketNum;
    TCP_CommunicationManager tcp_com_m(socketNum);
    yzt_tcp::connectToServer(serverAddr, tcp_com_m.getSocket());
    const char *sure = "yolo";
    tcp_com_m.Send((void *)sure, strlen(sure));
    sleep(2);

    pthread_t pid;
    pthread_create(&pid, NULL, getInfo, &tcp_com_m);

    char buff[128] = {0};
    while(1)
    {
        const char *b = "nihasdafao";
        tcp_com_m.Send((void *)b, strlen(b));
        sleep(1);
        memset(buff, 0, 128);
    }

    // while(1)
    // {
    //     sleep(1);
    // }

    return 0;
}
