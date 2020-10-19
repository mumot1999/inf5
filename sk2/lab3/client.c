// kompilacja: gcc <nazwa tego pliku> -Wall -o <nazwa pliku wynikowego>
// nadanie uprawnieĹ do uruchomienia pliku wynikowego: chmod +x <nazwa pliku wynikowego>
// uruchomienie: ./<nazwa pliku wynikowego>

//TODO doĹÄczenie wymaganych plikĂłw nagĹĂłwkowych
// poszukaÄ w man <nazwa funkcji> i w man 7 ip
// ewentualnie przy kompilacji z -Wall moĹźe pojawiÄ siÄ sugestia, wskazujÄca ktĂłrego pliku nagĹĂłwkowego brakuje
#include<stdio.h>
#include<string.h>	//strlen
#include<sys/socket.h>
#include<arpa/inet.h>	//inet_addr
#include<stdlib.h>

int main() {
	struct sockaddr_in server_addr;
    char server_reply[1000];
	int my_socket = socket( AF_INET , SOCK_STREAM , 0 );

	// memset(&server_addr, TODO , sizeof(struct sockaddr_in));
	server_addr.sin_family = AF_INET;
	server_addr.sin_port = htons(9000);
	//TODO przypisaÄ adres IP serwera
	//do pola server_addr.sin_addr.s_addr
	//uĹźywajÄc funkcji inet_pton
    inet_pton(AF_INET, "127.0.0.1", &(server_addr.sin_addr.s_addr));

	connect(my_socket, (struct sockaddr*) &server_addr, sizeof(struct sockaddr));
    write(my_socket, "3 10");


	while(recv(my_socket, server_reply , 2 , 0)){
		printf("%s", server_reply);
	}

	//TODO odebranie danych przesĹanych przez serwer i wyĹwietlenie ich na ekranie
	//przy uĹźyciu printf uwaga na buforowanie tekstu; nowa linia '\n' wymusza oprĂłĹźnienie buforu (flush)

	close(my_socket);
}