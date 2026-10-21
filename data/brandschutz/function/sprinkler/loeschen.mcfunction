# Boden suchen: Strahl senkrecht nach unten bis zum ersten festen Block (höchstens st_max Blöcke)
execute store result score #max brandschutz run data get storage brandschutz:config st_max
scoreboard players set #st brandschutz 0
execute positioned ~ ~-1 ~ run function brandschutz:boden_suchen

# Löschbereich: (2*sr+1)^2 Blöcke pro Schicht, #rest Schichten (eigene Schicht + alles bis zum Boden).
# Weil /fill höchstens 32768 Blöcke auf einmal schafft, wird in Scheiben mit #L Schichten gelöscht.
scoreboard players operation #rest brandschutz = #st brandschutz
scoreboard players add #rest brandschutz 1
execute store result score #L brandschutz run data get storage brandschutz:config sr 2
scoreboard players add #L brandschutz 1
scoreboard players operation #L brandschutz *= #L brandschutz
scoreboard players set #grenze brandschutz 32768
scoreboard players operation #grenze brandschutz /= #L brandschutz
scoreboard players operation #L brandschutz = #grenze brandschutz
execute if score #L brandschutz matches ..0 run scoreboard players set #L brandschutz 1

# Werte fürs Makro: sr, L, st (Tiefe bis Boden), d (= 2*sr, Kantenlänge für die Mob-Auswahl)
data modify storage brandschutz:tmp s set value {}
data modify storage brandschutz:tmp s.sr set from storage brandschutz:config sr
execute store result storage brandschutz:tmp s.L int 1 run scoreboard players get #L brandschutz
execute store result storage brandschutz:tmp s.st int 1 run scoreboard players get #st brandschutz
execute store result score #d brandschutz run data get storage brandschutz:config sr 2
execute store result storage brandschutz:tmp s.d int 1 run scoreboard players get #d brandschutz

function brandschutz:sprinkler/scheibe
function brandschutz:sprinkler/mobs with storage brandschutz:tmp s

playsound minecraft:weather.rain block @a[distance=..24] ~ ~ ~ 0.5 1.4
