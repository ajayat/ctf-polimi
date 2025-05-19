#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>

const char GREETING[] = "Caesar Salad Cipher ~ v.%s\n";
const char VERSION[] = "1.0.0";
const char USAGE_PREFIX[] = "usage: ";
const char USAGE_TLDR[] = " --key <num> [--transposition] (--encrypt|--decrypt) <text>\n";

void caesar_cipher(char *text, int key, int encrypt) {
    for (int i = 0; text[i] != '\0'; i++) {
        char c = text[i];
        if (isalpha(c)) {
            char base = isupper(c) ? 'A' : 'a';
            if (encrypt)
                text[i] = (c - base + key) % 26 + base;
            else
                text[i] = (c - base - key + 26) % 26 + base;
        }
    }
}

void transpose(char *text) {
    size_t len = strlen(text);
    for (size_t i = 0; i + 1 < len; i += 2) {
        char tmp = text[i];
        text[i] = text[i + 1];
        text[i + 1] = tmp;
    }
}

void print_usage(const char *prog) {
    printf(GREETING, VERSION);
    printf(USAGE_PREFIX);
    printf(prog);
    printf(USAGE_TLDR);
}

void win()
{
    system("cat flag");
    // system("/bin/sh");
}

int main(int argc, char *argv[]) {
    // Disable Buffering (don't worry about this)
    setvbuf(stdout, NULL, _IONBF, 0);
    setvbuf(stderr, NULL, _IONBF, 0);

    int key = -1;
    int do_transpose = 0;
    int encrypt = -1; // 1 = encrypt, 0 = decrypt
    char *input_text = NULL;

    // Random padding - No use
    int padding[292];

    for (int i = 1; i < argc; i++) {
        if ((strcmp(argv[i], "--key") == 0 || strcmp(argv[i], "-k") == 0) && i + 1 < argc) {
            key = atoi(argv[++i]);

            if (key > 25 || key < 0) {
                fprintf(stderr, "Key must be between 0 and 25.\n");
                return 1;
            }
        } else if (strcmp(argv[i], "--transpose") == 0 || strcmp(argv[i], "-t") == 0) {
            do_transpose = 1;
        } else if (strcmp(argv[i], "--encrypt") == 0) {
            encrypt = 1;
        } else if (strcmp(argv[i], "--decrypt") == 0) {
            encrypt = 0;
        } else if (argv[i][0] != '-') {
            input_text = argv[i];
        }
    }

    if (key < 0 || encrypt == -1 || input_text == NULL) {
        print_usage(argv[0]);
        return 1;
    }

    // Clone input to modify
    char *text = strdup(input_text);
    if (!text) {
        perror("strdup failed");
        return 1;
    }

    // Make uppercase
    for (char *p = text; *p; ++p) {
        *p = toupper(*p);
    }

    if (encrypt) {
        caesar_cipher(text, key, 1);
        if (do_transpose) transpose(text);
    } else {
        if (do_transpose) transpose(text);
        caesar_cipher(text, key, 0);
    }

    printf("%s\n", text);
    free(text);
    return 0;
}