# Makro {ton, abstand, reichweite, lautstaerke, ticks}
# brandschutz.ton = verbleibende Ticks, solange der Ton dieses Melders noch läuft
$execute if entity @e[type=interaction,tag=brandschutz.melder,scores={brandschutz.ton=1..},distance=..$(abstand)] run return 0
$playsound $(ton) master @a[distance=..$(reichweite)] ~ ~ ~ $(lautstaerke) 1
$scoreboard players set @s brandschutz.ton $(ticks)
