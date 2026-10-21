# Ausgeführt an der Position des (bereits entfernten) Rahmens. #typ: 1 = Rauchmelder, 2 = Sprinkler, 3 = Knopf
execute if score #typ brandschutz matches 1 run loot spawn ~ ~ ~ loot brandschutz:rauchmelder
execute if score #typ brandschutz matches 2 run loot spawn ~ ~ ~ loot brandschutz:sprinkler
execute if score #typ brandschutz matches 3 run loot spawn ~ ~ ~ loot brandschutz:knopf
execute if score #typ brandschutz matches 1..2 run title @p[distance=..8] actionbar {text:"Nur an der Decke montierbar!",color:"red"}
execute if score #typ brandschutz matches 3 run title @p[distance=..8] actionbar {text:"Feueralarm-Knopf nur an der Wand montierbar!",color:"red"}
