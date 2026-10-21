# Entscheidet, ob dieser Melder in diesem Tick scannt.
#   Ruhezustand: wenn (Phase % Periode) == #scan   -> alle "intervall" Sekunden
#   Alarm:       wenn (Phase % 20)      == #takt   -> jede Sekunde
# So verteilt sich die Last gleichmäßig, statt alle Melder im selben Tick scannen zu lassen.
execute unless score @s brandschutz.phase matches 0.. run function brandschutz:melder/phase_setzen

scoreboard players set #dran brandschutz 0
scoreboard players operation #p brandschutz = @s brandschutz.phase
execute if entity @s[tag=brandschutz.alarm] run scoreboard players operation #p brandschutz %= #20 brandschutz
execute if entity @s[tag=brandschutz.alarm] if score #p brandschutz = #takt brandschutz run scoreboard players set #dran brandschutz 1
execute unless entity @s[tag=brandschutz.alarm] run scoreboard players operation #p brandschutz %= #periode brandschutz
execute unless entity @s[tag=brandschutz.alarm] if score #p brandschutz = #scan brandschutz run scoreboard players set #dran brandschutz 1

execute if score #dran brandschutz matches 1 at @s run function brandschutz:melder/pruefen
