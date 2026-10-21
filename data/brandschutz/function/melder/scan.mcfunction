# Makro {r, unten, puffer, puffer_oben}: zählt Feuerblöcke in einer Scheibe (Ergebnis in brandschutz.feuer)
# und leert den Puffer wieder (nur bei Treffer)
$execute store result score @s brandschutz.feuer run clone ~-$(r) ~-$(unten) ~-$(r) ~$(r) ~ ~$(r) ~-$(r) $(puffer) ~-$(r) filtered #minecraft:fire
$execute if score @s brandschutz.feuer matches 1.. run fill ~-$(r) $(puffer) ~-$(r) ~$(r) $(puffer_oben) ~$(r) air replace #minecraft:fire
