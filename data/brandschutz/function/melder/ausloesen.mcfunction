# Makro {verbindung}: alle Sprinkler in einer Kugel mit diesem Radius für 3 Sekunden aktivieren (wird jede Sekunde erneuert, solange es brennt)
$execute as @e[type=interaction,tag=brandschutz.sprinkler,distance=..$(verbindung)] run scoreboard players set @s brandschutz.aktiv 60
