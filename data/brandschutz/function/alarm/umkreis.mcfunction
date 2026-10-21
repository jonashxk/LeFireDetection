# Makro {radius}: löst alle Rauchmelder in diesem Umkreis manuell aus.
# Vorher setzen: #grund (1 = Probealarm, 2 = Knopf), #dauer (Sekunden). Ergebnis: #anz = Anzahl Melder.
$execute store result score #anz brandschutz if entity @e[type=interaction,tag=brandschutz.melder,distance=..$(radius)]
$execute as @e[type=interaction,tag=brandschutz.melder,distance=..$(radius)] at @s run function brandschutz:melder/manuell
