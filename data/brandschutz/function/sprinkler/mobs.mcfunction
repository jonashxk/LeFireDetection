# Makro {sr, st, d}: brennende Mobs im ganzen Löschbereich ablöschen (bei Spielern geht das per Befehl nicht)
$execute positioned ~-$(sr) ~-$(st) ~-$(sr) as @e[type=!player,type=!interaction,type=!block_display,dx=$(d),dy=$(st),dz=$(d)] run data modify entity @s Fire set value 0s
