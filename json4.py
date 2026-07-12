import time
import os
import requests
import json
import pandas

url = "https://rickandmortyapi.com/api/character"

headers = {"User-Agent": "Mozilla/5.0"}

all_characters = []

while url is not None:
    response = requests.get(url, headers=headers)
    data = response.json()

    for char in data["results"]:
        all_characters.append({
            "name": char["name"],
            "status": char["status"],
        })

    url = data["info"]["next"]
    print("Собрано на текущий момент: ", len(all_characters))
    time.sleep(0.3)

stats = {
    "Alive":0,
    "Dead":0,
}

for char in all_characters:
    status = char["status"] #Dead или Alive. Unknown
    stats[status] = stats.get(status, 0) + 1

print("Живых:", stats["Alive"])
print("Мертвых:", stats["Dead"])

result = {
    "total": len(all_characters),
    "stats": stats,
    "all_characters": all_characters,
}

os.makedirs("data", exist_ok=True)

with open("data/ur_faces.json", "w", encoding="utf-8") as f:
    json.dump(result, f, ensure_ascii=False, indent=4)

dataframe = pandas.DataFrame(all_characters)
dataframe.to_excel("data/res.xlsx", index=False)