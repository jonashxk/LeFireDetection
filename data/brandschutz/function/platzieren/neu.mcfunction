# Ausgeführt als neu platzierter (unsichtbarer) Rahmen.
# #typ: 1 = Rauchmelder, 2 = Sprinkler (beide nur Decke), 3 = Feueralarm-Knopf (nur Wand)
scoreboard players set #ok brandschutz 0
scoreboard players set #typ brandschutz 0
execute if entity @s[tag=brandschutz.neu_melder] run scoreboard players set #typ brandschutz 1
execute if entity @s[tag=brandschutz.neu_sprinkler] run scoreboard players set #typ brandschutz 2
execute if entity @s[tag=brandschutz.neu_knopf] run scoreboard players set #typ brandschutz 3

# Decke: knapp über dem Rahmen ist ein Block
execute if score #typ brandschutz matches 1..2 unless block ~ ~0.1 ~ #minecraft:air run function brandschutz:platzieren/decke
# Wand: knapp neben dem Rahmen ist ein Block
execute if score #typ brandschutz matches 3 run function brandschutz:platzieren/wand

# Erst den Rahmen entfernen, dann ggf. das Item zurückgeben.
# (Sonst würde das Aufräumen in "entfernen" das zurückgegebene Item gleich mit löschen.)
function brandschutz:platzieren/entfernen
execute if score #ok brandschutz matches 0 run function brandschutz:platzieren/falsch
