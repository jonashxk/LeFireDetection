scoreboard players remove @s brandschutz.aktiv 1

# Optik: Wasserregen passend zum Löschradius + Spritzer am Sprinklerkopf
function brandschutz:sprinkler/partikel with storage brandschutz:tmp p
particle minecraft:splash ~ ~ ~ 0.3 0.05 0.3 0.6 12

# Zweimal pro Sekunde: Feuer löschen + Geräusch
execute if score #takt brandschutz matches 0 run function brandschutz:sprinkler/loeschen
execute if score #takt brandschutz matches 10 run function brandschutz:sprinkler/loeschen
