#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void win() {
    execve("/bin/sh", NULL, NULL); 
}

void prompt() {
    char buf[117];
    printf("bill@PC's password: ");
    fgets(buf, 160, stdin);
    printf("%s", buf);
}

int main(int argc, char* argv[]) {
    alarm(120);
    setvbuf(stdin, 0, 2, 0);
    setvbuf(stdout, 0, 2, 0);
    setvbuf(stderr, 0, 2, 0);
    prompt();
    return 0;
}