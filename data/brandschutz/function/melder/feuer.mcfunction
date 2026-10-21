execute unless entity @s[tag=brandschutz.alarm] run function brandschutz:melder/alarm_start
# Alarm hält noch 3 Sekunden nach dem letzten erkannten Feuer an
scoreboard players set @s brandschutz.alarm 3
function brandschutz:melder/ausloesen with storage brandschutz:config
