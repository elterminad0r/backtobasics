import json

json_str = """
{"members":
    [{"name": "Izaak",
      "age": 17},
     {"name": "Lena",
      "age": 15}
    ],
 "address": {
    "house_no": 314159265,
    "street": "[redacted] road",
    "village": "great [redacted]",
    "postcode": "cb22 [redacted]"
 }
}
"""

van_dongens = json.loads(json_str)

print(van_dongens)
print(van_dongens["members"][0]["name"])
print("there are {} van dongens".format(len(van_dongens["members"])))

print("back to json: \n{}".format(json.dumps(van_dongens, indent=4)))
print(json.dumps(van_dongens, separators=(',',':')))
