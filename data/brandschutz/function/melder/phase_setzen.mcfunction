# Phasen reihum vergeben: 0, 1, 2, ... Aufeinanderfolgende Melder landen so in verschiedenen Ticks.
# (Die Phase wird beim Prüfen per Modulo auf die aktuelle Periode umgerechnet.)
scoreboard players operation @s brandschutz.phase = #naechste_phase brandschutz
scoreboard players add #naechste_phase brandschutz 1
execute if score #naechste_phase brandschutz matches 100000.. run scoreboard players set #naechste_phase brandschutz 0
