# Ausgeführt als Knopf-Hitbox nach Rechtsklick
data remove entity @s interaction

# Sperre gegen Dauerklicken (2 Sekunden)
execute if score @s brandschutz.sperre matches 1.. run return 0
scoreboard players set @s brandschutz.sperre 40

playsound minecraft:block.stone_button.click_on block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:dust{color:[1.0,0.0,0.0],scale:0.8} ~ ~0.2 ~ 0.1 0.1 0.1 0 8

# Alle Melder im Umkreis manuell auslösen
scoreboard players set #grund brandschutz 2
execute store result score #dauer brandschutz run data get storage brandschutz:config knopf_dauer
data modify storage brandschutz:tmp m set value {}
data modify storage brandschutz:tmp m.radius set from storage brandschutz:config knopf_radius
function brandschutz:alarm/umkreis with storage brandschutz:tmp m

execute if score #anz brandschutz matches 0 run title @p[distance=..8] actionbar {text:"Kein Rauchmelder in Reichweite!",color:"gray"}
