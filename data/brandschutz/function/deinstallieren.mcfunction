# Entfernt alle Geräte (in geladenen Chunks) und alle Daten des Datapacks
kill @e[type=block_display,tag=brandschutz.teil]
kill @e[type=interaction,tag=brandschutz.geraet]
scoreboard objectives remove brandschutz
scoreboard objectives remove brandschutz.feuer
scoreboard objectives remove brandschutz.alarm
scoreboard objectives remove brandschutz.aktiv
scoreboard objectives remove brandschutz.phase
scoreboard objectives remove brandschutz.manuell
scoreboard objectives remove brandschutz.sperre
scoreboard objectives remove brandschutz.ton
data remove storage brandschutz:config ton
data remove storage brandschutz:config ton_dauer
data remove storage brandschutz:config ton_abstand
data remove storage brandschutz:config ton_reichweite
data remove storage brandschutz:tmp t
data remove storage brandschutz:config probe_radius
data remove storage brandschutz:config probe_dauer
data remove storage brandschutz:config knopf_radius
data remove storage brandschutz:config knopf_dauer
data remove storage brandschutz:tmp m
data remove storage brandschutz:tmp p
data remove storage brandschutz:config r
data remove storage brandschutz:config melder_max
data remove storage brandschutz:config sr
data remove storage brandschutz:config st_max
data remove storage brandschutz:config verbindung
data remove storage brandschutz:config intervall
data remove storage brandschutz:tmp a
data remove storage brandschutz:tmp s
tellraw @s {text:"[Brandschutz] entfernt. Jetzt noch /datapack disable ausführen.",color:"gold"}
