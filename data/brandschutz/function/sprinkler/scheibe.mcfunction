# Löscht eine Scheibe ab der aktuellen Höhe nach unten. Höhe = min(#rest, #L) Schichten.
scoreboard players operation #n brandschutz = #rest brandschutz
scoreboard players operation #n brandschutz < #L brandschutz
scoreboard players remove #n brandschutz 1
execute store result storage brandschutz:tmp s.unten int 1 run scoreboard players get #n brandschutz
function brandschutz:sprinkler/scheibe_fill with storage brandschutz:tmp s

# Noch Schichten übrig? Dann eine Scheibe tiefer weitermachen.
scoreboard players operation #rest brandschutz -= #L brandschutz
execute if score #rest brandschutz matches 1.. run function brandschutz:sprinkler/weiter with storage brandschutz:tmp s
