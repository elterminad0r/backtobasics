import json

with open("vandongens.json", "r") as json_file:
    van_dongens = json.load(json_file)

print("Postcodey stuff = {}".format(van_dongens["address"]["postcode"].split()[0]))
print("YAY")
van_dongens["address"]["house_no"] += 1
print("new house number: {}".format(van_dongens["address"]["house_no"]))

with open("new_van_dongens.json", "w") as output_file:
    json.dump(van_dongens, output_file)
