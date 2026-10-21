# Ausgeführt als Rahmen. Ermittelt, an welcher Wand er hängt, und baut den Knopf dort auf:
# positioniert auf der Mitte der Wandoberfläche, gedreht so, dass "vorne" von der Wand weg zeigt.
execute if score #ok brandschutz matches 0 unless block ~ ~ ~-0.1 #minecraft:air align xyz positioned ~0.5 ~0.5 ~0.5 rotated 0 0 positioned ^ ^ ^-0.5 run function brandschutz:knopf/aufbauen {yaw:0}
execute if score #ok brandschutz matches 0 unless block ~ ~ ~0.1 #minecraft:air align xyz positioned ~0.5 ~0.5 ~0.5 rotated 180 0 positioned ^ ^ ^-0.5 run function brandschutz:knopf/aufbauen {yaw:180}
execute if score #ok brandschutz matches 0 unless block ~-0.1 ~ ~ #minecraft:air align xyz positioned ~0.5 ~0.5 ~0.5 rotated -90 0 positioned ^ ^ ^-0.5 run function brandschutz:knopf/aufbauen {yaw:-90}
execute if score #ok brandschutz matches 0 unless block ~0.1 ~ ~ #minecraft:air align xyz positioned ~0.5 ~0.5 ~0.5 rotated 90 0 positioned ^ ^ ^-0.5 run function brandschutz:knopf/aufbauen {yaw:90}
