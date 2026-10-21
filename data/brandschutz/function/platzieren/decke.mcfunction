execute if entity @s[tag=brandschutz.neu_melder] align xyz positioned ~0.5 ~1 ~0.5 run function brandschutz:melder/aufbauen
execute if entity @s[tag=brandschutz.neu_sprinkler] align xyz positioned ~0.5 ~1 ~0.5 run function brandschutz:sprinkler/aufbauen
scoreboard players set #ok brandschutz 1
