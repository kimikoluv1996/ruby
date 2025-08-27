import json as j

print("let's add some json")
a = list()
v1 = input("value 1: ")
v2 = input("value 2: ")
a.append(v1)
a.append(v2)
with open("tests/dump.json", "x") as file:
    j.dump(a, file)

print("done")