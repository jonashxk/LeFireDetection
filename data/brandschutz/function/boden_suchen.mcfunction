# Gemeinsam genutzt von Rauchmelder und Sprinkler.
# Vorher setzen: #st = 0, #max = maximale Tiefe; aufrufen mit "positioned ~ ~-1 ~".
# Läuft rekursiv nach unten, solange der Block durchlässig ist (Luft, Feuer, Gras, ...).
# Ergebnis: #st = Anzahl durchlässiger Blöcke bis zum Boden.
execute unless block ~ ~ ~ #brandschutz:durchlaessig run return 0
scoreboard players add #st brandschutz 1
execute if score #st brandschutz >= #max brandschutz run return 0
execute positioned ~ ~-1 ~ run function brandschutz:boden_suchen
