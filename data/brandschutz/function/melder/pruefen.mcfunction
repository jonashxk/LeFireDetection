# Ausgeführt als Rauchmelder-Hitbox (Ruhezustand alle "intervall" Sekunden, im Alarm jede Sekunde).
#
# Trick: Alle Feuerblöcke im Bereich werden per "/clone ... filtered #minecraft:fire"
# in einen Puffer ganz oben in der Welt kopiert. Der Rückgabewert ist die Anzahl der Feuerblöcke.
# Das ist viel schneller, als jeden Block einzeln zu prüfen.
#
# Geprüft wird von der Decke bis zum Boden unter dem Melder. Weil /clone höchstens 32768 Blöcke
# auf einmal schafft, wird der Bereich in Scheiben zerlegt (bei r=15: bis zu 34 Schichten, bei r=30: 8).
# Sobald eine Scheibe Feuer enthält, werden die restlichen nicht mehr geprüft.

scoreboard players set #grund brandschutz 0
data modify storage brandschutz:tmp a set value {}
data modify storage brandschutz:tmp a.r set from storage brandschutz:config r

# 1) Boden suchen -> #rest = Anzahl zu prüfender Schichten (eigene Schicht + alles bis zum Boden)
execute store result score #max brandschutz run data get storage brandschutz:config melder_max
scoreboard players set #st brandschutz 0
execute positioned ~ ~-1 ~ run function brandschutz:boden_suchen
scoreboard players operation #rest brandschutz = #st brandschutz
scoreboard players add #rest brandschutz 1

# 2) Scheibenhöhe #L = 32768 / (2r+1)^2
execute store result score #L brandschutz run data get storage brandschutz:config r 2
scoreboard players add #L brandschutz 1
scoreboard players operation #L brandschutz *= #L brandschutz
scoreboard players set #grenze brandschutz 32768
scoreboard players operation #grenze brandschutz /= #L brandschutz
scoreboard players operation #L brandschutz = #grenze brandschutz
execute if score #L brandschutz matches ..0 run scoreboard players set #L brandschutz 1
execute store result storage brandschutz:tmp a.L int 1 run scoreboard players get #L brandschutz

# 3) Puffer = die obersten #L Schichten der Dimension
scoreboard players set #oben brandschutz 256
execute if dimension minecraft:overworld run scoreboard players set #oben brandschutz 320
scoreboard players operation #puffer brandschutz = #oben brandschutz
scoreboard players operation #puffer brandschutz -= #L brandschutz
scoreboard players remove #oben brandschutz 1
execute store result storage brandschutz:tmp a.puffer int 1 run scoreboard players get #puffer brandschutz
execute store result storage brandschutz:tmp a.puffer_oben int 1 run scoreboard players get #oben brandschutz

# 4) Scheiben prüfen (nicht, wenn der Melder selbst im Pufferbereich hängt
#    und nicht während eines manuellen Alarms – da steht das Ergebnis ohnehin fest)
execute store result score #y brandschutz run data get entity @s Pos[1]
scoreboard players set @s brandschutz.feuer 0
execute unless score @s brandschutz.manuell matches 1.. if score #y brandschutz < #puffer brandschutz run function brandschutz:melder/scheibe

# 5) Manueller Alarm (Probealarm / Knopf) zählt wie Feuer, solange die Zeit läuft
execute if score @s brandschutz.manuell matches 1.. run scoreboard players set @s brandschutz.feuer 1
execute if score @s brandschutz.manuell matches 1.. run scoreboard players remove @s brandschutz.manuell 1

execute if score @s brandschutz.feuer matches 1.. run function brandschutz:melder/feuer
execute unless score @s brandschutz.feuer matches 1.. if entity @s[tag=brandschutz.alarm] run function brandschutz:melder/kein_feuer
