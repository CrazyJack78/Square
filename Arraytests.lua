local Tasche = {"Kirsche","Orange"}

Tasche[#Tasche+1] = {"Apfel"}
Tasche[#Tasche+1] = {"Banana"}
--table.inserts("Kirsche")
--table.inserts("Anderes")

print(Tasche[1])
print(Tasche[2])
print(Tasche[3][1])
print(Tasche[4][1])
for Index, Name in pairs(Tasche) do
    print(Index, "  ", Name)
end