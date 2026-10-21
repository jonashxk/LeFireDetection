# Ausgeführt als Interaction-Hitbox eines Geräts, das angeschlagen wurde
execute if entity @s[tag=brandschutz.melder] run loot spawn ~ ~ ~ loot brandschutz:rauchmelder
execute if entity @s[tag=brandschutz.sprinkler] run loot spawn ~ ~ ~ loot brandschutz:sprinkler
execute if entity @s[tag=brandschutz.knopf] run loot spawn ~ ~ ~ loot brandschutz:knopf
playsound minecraft:block.copper.break block @a ~ ~ ~ 1 1.2
kill @e[type=block_display,tag=brandschutz.teil,distance=..0.8]
kill @s
