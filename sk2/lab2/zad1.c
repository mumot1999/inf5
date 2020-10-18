#include<stdio.h>
#include<string.h>	//strlen
#include<sys/socket.h>
#include<arpa/inet.h>	//inet_addr
#include<stdlib.h>

int main(int argc , char *argv[])
{
	uint16_t port;
	int socket_desc;
	struct sockaddr_in server;
	char *message , server_reply[6000], ip_address[60];
	
	//Create socket
	socket_desc = socket(AF_INET , SOCK_STREAM , 0);
	if (socket_desc == -1)
	{
		printf("Could not create socket");
	}

	strcpy(ip_address, "132.163.96.2");
	port = 13;

	if(argv[1]){
		strcpy(ip_address, argv[1]);
	}

	if(argc == 3 && argv[2])
		port = strtol(argv[2], NULL, 10);

	server.sin_family = AF_INET;
	server.sin_port = htons( port );
	inet_pton(AF_INET, ip_address, &(server.sin_addr.s_addr));

	printf("Connecting %s : %d\n", ip_address, port);

	//Connect to remote server
	int res = connect(socket_desc , (struct sockaddr *)&server , sizeof(server));

	if (res < 0)
	{
		puts("connect error");
		return 1;
	}
	
	puts("Connected\n");

	while(recv(socket_desc, server_reply , 2 , 0)){
		printf("%s", server_reply);
	}

	return 0;
}
 