#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdint.h>
#include <sys/mman.h>


#define SHELLCODE_SIZE 256

static const char base64_table[] =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

int base64_char_to_value(char c) {
    const char *p = strchr(base64_table, c);
    if (p) return p - base64_table;
    return -1;
}

int base64_decode(const char *input, unsigned char *output, int output_size) {
    int len = strlen(input);
    int i, j;
    int out_len = 0;
    int val, pad;

    for (i = 0; i < len; i += 4) {
        // Check if we are overflowing from the output buffer
        if (out_len > output_size - 2) {
            return -1; 
        }
        val = 0;
        pad = 0;

        for (j = 0; j < 4; j++) {
            val <<= 6;
            if (input[i + j] == '=') {
                pad++;
            } else {
                int tmp = base64_char_to_value(input[i + j]);
                if (tmp < 0) return -1;  // Invalid character
                val |= tmp;
            }
        }

        output[out_len++] = (val >> 16) & 0xFF;
        output[out_len++] = (val >> 8) & 0xFF;
        output[out_len++] = val & 0xFF;
    }

    // Adjust length based on padding
    return out_len - pad;
}

typedef struct __attribute__((packed)) {
    char name[200];
    uint8_t credits;
    uint8_t *shellcode;
} service_t;

service_t service = {
    .name = "Dummy Shellcode",
    .credits = 0
};

void check(service_t *s) {
    uint8_t check1[] = "\xcd\x80"; // int 0x80 at 32-bits
    uint8_t check2[] = "\x0f\x05"; // syscall at 32-bits


    for (int i = 0; i < SHELLCODE_SIZE - 1; i++) {
        if (s->shellcode[i] == check1[0] && s->shellcode[i + 1] == check1[1]) {
            printf("Shellcode contains int 0x80 instruction!\n");
            exit(1);
        }
        if (s->shellcode[i] == check2[0] && s->shellcode[i + 1] == check2[1]) {
            printf("Shellcode contains syscall instruction!\n");
            exit(1);
        }
    }

    printf("Shellcode is safe to execute!\n");
}

void menu() {
    printf("\n1. Rename shellcode\n");
    printf("2. Print shellcode name\n");
    printf("3. Print credits\n");
    printf("4. Add credits\n");
    printf("5. Read shellcode\n");
    printf("6. Execute shellcode\n");
    printf("7. Exit\n");
    printf("> ");
}

unsigned int readint() {
    unsigned int value;
    scanf("%u", &value);
    while (getchar() != '\n'); // Clear the input buffer
    return value;
}

void read_shellcode(service_t *s) {
    // Sets the number of credits to minimum of current credits and 64
    // 64 * 4 = 256 -> Maximum shellcode length

    if (s->credits > 64) {
        s->credits = 64;
    }

    if (s->credits <= 0) {
        printf("You have no credits!\n");
        return;
    }

    printf("You have %d credits\n", s->credits);
    printf("How many credits you want to use?\n");

    unsigned int credits = readint();

    if (credits <= 0 || credits > s->credits) {
        printf("Invalid number of credits!\n");
        return;
    }
    unsigned int shellcode_size = credits * 4;

    // Should not happen in theory
    if (shellcode_size > SHELLCODE_SIZE) {
        printf("Shellcode size exceeds limit!\n");
        return;
    }

    s->credits -= credits;
    printf("Please provide %d bytes of shellcode (in hex):\n", shellcode_size);
    for (int i = 0; i < shellcode_size; i++) {
        unsigned int byte;
        if (scanf("%2x", &byte) != 1) {
            printf("Invalid input!\n");
            return;
        }
        s->shellcode[i] = (uint8_t)byte;
    }
}

void rename_shellcode(service_t *s) {
    char base64_input[4096];
    printf("Please provide the base64 encoded name:\n");
    if (NULL == fgets(base64_input, sizeof(base64_input), stdin)) {
        perror("fgets failed");
        exit(1);
    }

    // Remove newline character
    base64_input[strcspn(base64_input, "\n")] = 0;

    // Check that the input length is a multiple of 4, for base64 correctness
    if (strlen(base64_input) % 4 != 0) {
        printf("Invalid base64 input!\n");
        return;
    }

    // Decode the base64 input
    base64_decode(base64_input, s->name, 200);

}

int main() {
    int choice;

    setvbuf(stdout, NULL, _IONBF, 0);
    setvbuf(stderr, NULL, _IONBF, 0);
    setvbuf(stdin, NULL, _IONBF, 0);

    alarm(60);

    printf("Welcome to our nerdy shellcode service!\n");
    printf("We execute your shellcode, if you have enough credits!\n\n");
    printf("The house rules are simple:\n");
    printf("1. 1 credit is worth 4 bytes of shellcode\n");
    printf("2. You can't use int 0x80 or syscall instructions\n");

    // Allocate executable memory for the shellcode
    // TODO: Make the shellcode only readable and executable before executing it
    service.shellcode = mmap(NULL, SHELLCODE_SIZE, 
        PROT_READ | PROT_WRITE | PROT_EXEC, 
        MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);


    if (service.shellcode == MAP_FAILED) {
        perror("mmap failed");
        exit(1);
    }

    memset(service.shellcode, 0, SHELLCODE_SIZE);
    *service.shellcode = 0xC3 ; // Just a return!

    while(1) {
        menu();
        choice = readint();

        switch (choice) {
            case 1:
                rename_shellcode(&service);
                break;
            case 2:
                printf("Name: %s\n", service.name);
                break;
            case 3:
                printf("Credits: %d\n", service.credits);
                break;
            case 4:
                printf("The boss says we are still implementing this feature!\n");
                break;
            case 5:
                read_shellcode(&service);
                break;
            case 6:
                printf("Executing shellcode...\n");
                check(&service);
                // Execute the shellcode
                void (*func)() = (void (*)())service.shellcode;
                func();
                break;
            case 7:
                printf("Goodbye!\n");
                exit(0);
            default:
                printf("Invalid choice\n");
                break;
        }

        
    }
}
