# Ausgeführt als Melder beim Auslösen. Spielt den Alarmton aus dem Resourcepack, aber nur einmal pro Bereich:
# Läuft bei einem anderen Melder in der Nähe der Ton schon, bleibt dieser Melder stumm.
data modify storage brandschutz:tmp t set value {}
data modify storage brandschutz:tmp t.ton set from storage brandschutz:config ton
data modify storage brandschutz:tmp t.abstand set from storage brandschutz:config ton_abstand
data modify storage brandschutz:tmp t.reichweite set from storage brandschutz:config ton_reichweite
# Lautstärke = Hörweite / 16 (Minecraft: ab Lautstärke 1 hört man einen Sound 16 Blöcke weit pro Lautstärke-Punkt)
execute store result storage brandschutz:tmp t.lautstaerke float 0.0625 run data get storage brandschutz:config ton_reichweite
execute store result storage brandschutz:tmp t.ticks int 20 run data get storage brandschutz:config ton_dauer
function brandschutz:melder/ton_abspielen with storage brandschutz:tmp t
