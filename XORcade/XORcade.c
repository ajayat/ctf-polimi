#include <fcntl.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

void init() {
  setvbuf(stdin, NULL, _IONBF, 0);
  setvbuf(stdout, NULL, _IONBF, 0);
  setvbuf(stderr, NULL, _IONBF, 0);
  srand(time(NULL));
  alarm(60);
}

void win() {
  FILE *fd = fopen("./flag", "r");
  if (fd == NULL) {
    perror("Error opening file");
    exit(1);
  }
  char buf[256];
  if (fgets(buf, sizeof(buf), fd) == NULL) {
    perror("Error reading file");
    fclose(fd);
    exit(1);
  }

  printf("Flag: %s\n", buf);
  fclose(fd);
  exit(0);
}

char key[] = {0xde, 0xad, 0xbe, 0xef};

void xor(char *str) {
  int key_index = 0;
  for (int i = 0; str[i] != '\0'; i++) {
    str[i] ^= key[key_index];
    key_index = (key_index + 1) % 4;
  }
}

int main() {
  char buf[96];
  int check_var;

  init();
  check_var = 0;
  printf("⚙️ Boot sequence initiated, hacker in the house!\n");
  printf("🔒 Mission: achieve arbitrary write on the stack like a true code "
         "ninja\n");

  check_var = rand();
  printf("🐛 check_var initialized at 0x%x – let’s see if you can flip it\n",
         check_var);
  printf("[🔑 DEBUG] check_var addr: %p\n", &check_var);
  printf("👉 Spit your payload here: ");
  ssize_t n = read(STDIN_FILENO, buf, 96 - 1);
  xor(buf);
  n = 96 - 1;
  buf[n] = '\0';
  printf(buf);
  printf("\n");

  printf("💣 Final check_var: 0x%x – did you pwn it?\n", check_var);
  if (check_var == 1012173464) {
    printf("💥 Boom! Triggering win()...\n");
    win();
  } else {
    printf("☠️ Exploitation failed. Back to the lab, n00b.\n");
  }

  return 0;
}