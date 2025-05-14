#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>



typedef struct {
    int admin_code;
    int user_pin[4];
    char name[44];
} user_data;


void win(){
    puts("Please, here is your password:");
    system("cat flag");
    exit(0);
}


int check(int *user_pin){
    int pin[4] = {1, 2, 3, 4};
    int i;

    for (i = 0; i < 4; i++){
        if (user_pin[i] != pin[i]){
            return 0;
        }
    }

    return 1;
}

void chall(){
    char select;
    int idx, digit;
    
    user_data data = {0};

    printf("Welcome to the password reset program!\n");
    printf("Here you can reset your password.\n");
    
    do{
        printf("Select 'i' to insert a new digit or 'c' to check the PIN.\n");
        scanf("%c%*c", &select);
        if (select == 'i'){
            printf("Specify the index and the new digit: ");
            scanf("%d %d%*c", &idx, &digit);
            idx = idx % 4;
            data.user_pin[idx] = digit;
        }
    } while (select != 'c');


    if (check(data.user_pin) && data.admin_code == 1){
        printf("Please now enter the account's name and we will send you the new password.");
        printf("Account name: ");
        gets(data.name);
        return;
    } else {
        printf("Sorry, you are not authorized to reset the password.\n");
        exit(1);
    }
}


int main(){
    setvbuf(stdout, 0, _IONBF, 0);
    setvbuf(stderr, 0, _IONBF, 0);
    setvbuf(stdin, 0, _IONBF, 0);
    alarm(60);

    chall();
    return 0;
}