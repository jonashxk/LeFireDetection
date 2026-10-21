# Ausgeführt als Melder: manueller Alarm (Probealarm oder Knopf) für #dauer Sekunden.
# Der Melder verhält sich dann wie bei echtem Feuer (siehe pruefen) und löst sofort aus.
scoreboard players operation @s brandschutz.manuell = #dauer brandschutz
function brandschutz:melder/feuer
