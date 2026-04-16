import json

data = json.load(open("tfoutputs.json"))

app_ip = data["app_public_ip"]["value"]
db_ip = data["db_private_ip"]["value"]

inventory = f"""
[app]
{app_ip}

[db]
{db_ip}
"""

with open("inventory.ini", "w") as f:
    f.write(inventory)