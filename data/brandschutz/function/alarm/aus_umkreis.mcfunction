# Makro {radius}
$execute as @e[type=interaction,tag=brandschutz.melder,tag=brandschutz.alarm,distance=..$(radius)] at @s run function brandschutz:alarm/aus_melder
$execute as @e[type=interaction,tag=brandschutz.sprinkler,distance=..$(radius)] run scoreboard players set @s brandschutz.aktiv 0
# Alarmton sofort stoppen (bei echtem Alarmende läuft er dagegen bis zum Schluss)
$execute as @e[type=interaction,tag=brandschutz.melder,distance=..$(radius)] run scoreboard players set @s brandschutz.ton 0
$stopsound @a[distance=..$(radius)] master $(ton)
