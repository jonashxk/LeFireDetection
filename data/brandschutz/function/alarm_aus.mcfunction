# /function brandschutz:alarm_aus
# Beendet alle Alarme (auch Probealarm/Knopf) und Sprinkler im Umkreis von probe_radius um den Spieler.
# Brennt es wirklich noch, schlägt der Melder bei der nächsten Prüfung erneut Alarm.
data modify storage brandschutz:tmp m set value {}
data modify storage brandschutz:tmp m.radius set from storage brandschutz:config probe_radius
data modify storage brandschutz:tmp m.ton set from storage brandschutz:config ton
function brandschutz:alarm/aus_umkreis with storage brandschutz:tmp m
tellraw @s [{text:"[Brandschutz] ",color:"gold"},{text:"Alle Alarme in der Nähe beendet.",color:"gray"}]
