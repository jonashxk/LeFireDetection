# Taktgeber 0..19 (eine Sekunde)
scoreboard players add #takt brandschutz 1
execute if score #takt brandschutz matches 20.. run scoreboard players set #takt brandschutz 0

# Scan-Taktgeber 0..(intervall*20 - 1) für Melder im Ruhezustand
execute store result score #periode brandschutz run data get storage brandschutz:config intervall 20
execute if score #periode brandschutz matches ..0 run scoreboard players set #periode brandschutz 20
scoreboard players add #scan brandschutz 1
execute if score #scan brandschutz >= #periode brandschutz run scoreboard players set #scan brandschutz 0

# Neu platzierte Geräte aufbauen
execute as @e[type=item_frame,tag=brandschutz.neu] at @s run function brandschutz:platzieren/neu

# Abbauen (Linksklick), Testknopf am Melder und Feueralarm-Knopf (Rechtsklick)
execute as @e[type=interaction,tag=brandschutz.geraet] if data entity @s attack at @s run function brandschutz:abbauen
execute as @e[type=interaction,tag=brandschutz.melder] if data entity @s interaction at @s run function brandschutz:melder/test
execute as @e[type=interaction,tag=brandschutz.knopf] if data entity @s interaction at @s run function brandschutz:knopf/druecken
execute as @e[type=interaction,tag=brandschutz.knopf,scores={brandschutz.sperre=1..}] run scoreboard players remove @s brandschutz.sperre 1

# Rauchmelder prüfen: im Ruhezustand alle "intervall" Sekunden, im Alarm jede Sekunde.
# Jeder Melder hat seine eigene Phase, damit sich die Last auf alle Ticks verteilt.
execute as @e[type=interaction,tag=brandschutz.melder] run function brandschutz:melder/takt

# Restlaufzeit des Alarmtons herunterzählen
execute as @e[type=interaction,tag=brandschutz.melder,scores={brandschutz.ton=1..}] run scoreboard players remove @s brandschutz.ton 1

# Alarm-Piepen zweimal pro Sekunde
execute if score #takt brandschutz matches 0 as @e[type=interaction,tag=brandschutz.alarm] at @s run function brandschutz:melder/piepen
execute if score #takt brandschutz matches 10 as @e[type=interaction,tag=brandschutz.alarm] at @s run function brandschutz:melder/piepen

# Aktive Sprinkler (Partikelwerte einmal pro Tick aus dem Löschradius berechnen)
execute store result storage brandschutz:tmp p.streu float 0.5 run data get storage brandschutz:config sr
execute store result storage brandschutz:tmp p.anzahl int 4 run data get storage brandschutz:config sr
execute as @e[type=interaction,tag=brandschutz.sprinkler,scores={brandschutz.aktiv=1..}] at @s run function brandschutz:sprinkler/spruehen
