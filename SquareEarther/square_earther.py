from pwn import process

BOARD_SIZE = 5
KNIGHT_MOVES = [(-2, -1), (-2, 1), (-1, -2), (-1, 2), (1, -2), (1, 2), (2, -1), (2, 1)]


def is_valid(x, y, visited: set) -> bool:
    return 0 <= x < BOARD_SIZE and 0 <= y < BOARD_SIZE and (x, y) not in visited


def generate_knight_tours(x, y, path: list, visited: set):
    if len(visited) == BOARD_SIZE * BOARD_SIZE:
        yield path.copy()

    for dx, dy in KNIGHT_MOVES:
        nx, ny = x + dx, y + dy
        if is_valid(nx, ny, visited):
            path.append((nx, ny))
            visited.add((nx, ny))
            yield from generate_knight_tours(nx, ny, path, visited)
            visited.remove((nx, ny))
            path.pop()


def send_knight_tour(binary_path: str, path: list[tuple[int, int]]) -> str | None:
    p = process(binary_path)

    for x, y in path:
        # Ajuster pour que (0,0) en haut à gauche soit cohérent avec ce qu'attend le binaire
        p.sendline(f"{x} {y}".encode())

    p.sendline(b"-1 -1")
    output = p.recvall(timeout=2)

    # On cherche le flag dans la sortie
    if b"Here is your flag:" in output:
        flag = output.split(b"Here is your flag:")[1].strip()
        return flag.decode()


def bruteforce_knight_tours(start: tuple[int, int]) -> str:
    # On génère tous les tours possibles du cavalier
    for path in generate_knight_tours(start[0], start[1], [], {start}):
        if flag := send_knight_tour(binary_path, path):
            return flag
    return None


if __name__ == "__main__":
    binary_path = "./square-earther"
    flag = bruteforce_knight_tours(start=(1, 1))
    print(f"Flag: {flag}")
