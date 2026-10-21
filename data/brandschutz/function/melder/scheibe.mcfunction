# Prüft eine Scheibe ab der aktuellen Höhe nach unten. Höhe = min(#rest, #L) Schichten.
scoreboard players operation #n brandschutz = #rest brandschutz
scoreboard players operation #n brandschutz < #L brandschutz
scoreboard players remove #n brandschutz 1
execute store result storage brandschutz:tmp a.unten int 1 run scoreboard players get #n brandschutz
function brandschutz:melder/scan with storage brandschutz:tmp a

# Noch Schichten übrig und bisher kein Feuer? Dann eine Scheibe tiefer weitermachen.
scoreboard players operation #rest brandschutz -= #L brandschutz
execute if score @s brandschutz.feuer matches 0 if score #rest brandschutz matches 1.. run function brandschutz:melder/weiter with storage brandschutz:tmp a
