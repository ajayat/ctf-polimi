#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include<string.h>
#include<unistd.h>
#define __USE_GNU
#include<dlfcn.h>


void print_banner(){
    printf("╔─────────────────────────────────────────────────────────────────────────────────────────────────────╗\n");
    printf("│                                                                                                     │\n");
    printf("│  ██▓     ██▓ ▄▄▄▄    ▄████▄     ▓█████ ▒██   ██▒ ██▓███   ██▓     ▒█████   ██▀███  ▓█████  ██▀███   │\n");
    printf("│ ▓██▒    ▓██▒▓█████▄ ▒██▀ ▀█     ▓█   ▀ ▒▒ █ █ ▒░▓██░  ██▒▓██▒    ▒██▒  ██▒▓██ ▒ ██▒▓█   ▀ ▓██ ▒ ██▒ │\n");
    printf("│ ▒██░    ▒██▒▒██▒ ▄██▒▓█    ▄    ▒███   ░░  █   ░▓██░ ██▓▒▒██░    ▒██░  ██▒▓██ ░▄█ ▒▒███   ▓██ ░▄█ ▒ │\n");
    printf("│ ▒██░    ░██░▒██░█▀  ▒▓▓▄ ▄██▒   ▒▓█  ▄  ░ █ █ ▒ ▒██▄█▓▒ ▒▒██░    ▒██   ██░▒██▀▀█▄  ▒▓█  ▄ ▒██▀▀█▄   │\n");
    printf("│ ░██████▒░██░░▓█  ▀█▓▒ ▓███▀ ░   ░▒████▒▒██▒ ▒██▒▒██▒ ░  ░░██████▒░ ████▓▒░░██▓ ▒██▒░▒████▒░██▓ ▒██▒ │\n");
    printf("│ ░ ▒░▓  ░░▓  ░▒▓███▀▒░ ░▒ ▒  ░   ░░ ▒░ ░▒▒ ░ ░▓ ░▒▓▒░ ░  ░░ ▒░▓  ░░ ▒░▒░▒░ ░ ▒▓ ░▒▓░░░ ▒░ ░░ ▒▓ ░▒▓░ │\n");
    printf("│ ░ ░ ▒  ░ ▒ ░▒░▒   ░   ░  ▒       ░ ░  ░░░   ░▒ ░░▒ ░     ░ ░ ▒  ░  ░ ▒ ▒░   ░▒ ░ ▒░ ░ ░  ░  ░▒ ░ ▒░ │\n");
    printf("│   ░ ░    ▒ ░ ░    ░ ░              ░    ░    ░  ░░         ░ ░   ░ ░ ░ ▒    ░░   ░    ░     ░░   ░  │\n");
    printf("│     ░  ░ ░   ░      ░ ░            ░  ░ ░    ░               ░  ░    ░ ░     ░        ░  ░   ░      │\n");
    printf("│                   ░ ░                                                                               │\n");
    printf("│                                                                                                     │\n");
    printf("╚─────────────────────────────────────────────────────────────────────────────────────────────────────╝\n");
    printf("\n Welcome to LIBC Explorer! You can use this tool to locate LIBC functions and its contents.\n");
    printf("** Since our developers are a bit lazy only two options are available at the moment, new features will be added soon **\n");
}

void print_menu(){
    printf("\n");
    printf("1. Search for a symbol inside the LIBC\n");
    printf("2. Search for a string inside the LIBC\n");
    printf("3. Exit\n\n");
    printf("Please select an option: ");
}

uint32_t get_libc_loaded_size() {
    FILE* fp;
    char filename[32];
    char line[1024];
    size_t total_size = 0; 
    snprintf(filename, sizeof(filename), "/proc/self/maps");

    fp = fopen(filename, "r");
    if (fp == NULL) {
        perror("Error opening /proc/self/maps");
        return 0;
    }

    while (fgets(line, sizeof(line), fp) != NULL) {
        if (strstr(line, "libc.so")) {
            unsigned long start_addr, end_addr;

            if (sscanf(line, "%lx-%lx", &start_addr, &end_addr) == 2) {
                total_size += (end_addr - start_addr);
            }
        }
    }

    fclose(fp);
    return total_size;
}

uint32_t get_libc_base_address(){
    // Use dlsym to get the base address of libc
    void *printf_addr = dlsym(RTLD_DEFAULT, "printf");
    if (printf_addr == NULL) {
        fprintf(stderr, "Error: %s\n", dlerror());
        exit(EXIT_FAILURE);
    }

    Dl_info info;
    if(dladdr(printf_addr, &info) == 0) {
        fprintf(stderr, "Error: %s\n", dlerror());
        exit(EXIT_FAILURE);
    } else {
        return (uint32_t)info.dli_fbase;
    }

}

void search_for_symbol(char *symbol_name){
    
    void *symbol_addr = dlsym(RTLD_DEFAULT, symbol_name);
    if (symbol_addr == NULL) {
        fprintf(stderr, "Symbol not found.\n");
        return;
    }
    
    printf("Symbol %s found at address: %p\n", symbol_name, symbol_addr);
}

void search_for_string(char *search_string, uint32_t base, uint32_t size){ 
    size_t search_string_len = strlen((char*)search_string);

    void *found_ptr = memmem((unsigned char*)base, size, search_string, search_string_len);

    if (found_ptr != NULL) {
        printf("String '%s' found at address: 0x%08x\n", search_string, (uint32_t)found_ptr);

    } else {
        printf("String '%s' not found in the memory block.\n", search_string);
    }
}

void init(){
    setvbuf(stdin, NULL, _IONBF, 0);
    setvbuf(stdout, NULL, _IONBF, 0);
    setvbuf(stderr, NULL, _IONBF, 0);
    alarm(120);
}

void main_loop(){
    uint32_t libc_base = get_libc_base_address();
    uint32_t libc_size = get_libc_loaded_size();
    printf("Size of loaded libc: %u bytes\n", libc_size);
    printf("Base address of libc: 0x%08x\n", libc_base);
    char buff[496];
    int exit = 0;
    while (!exit) {
        print_menu();
        int choice;
        
        scanf("%d", &choice);
        printf("\n");
        switch (choice) {
            case 1:
                printf("Enter the symbol name to search: ");
                scanf("%s", buff);
                search_for_symbol(buff);
                break;
            case 2:
                printf("Searching for a string...\n");
                printf("Enter the string to search: ");
                scanf("%s", buff);
                search_for_string(buff, libc_base, libc_size);
                break;
            case 3:
                exit = 1;
                break;
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }
    printf("Exiting...\n");
    return;
}

int main(){
    init();
    print_banner();
    main_loop();
    return 0;   
}