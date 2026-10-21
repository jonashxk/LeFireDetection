# Makro {yaw}. Position: Mitte der Wandoberfläche, Blickrichtung von der Wand weg.
# Die Display-Entities werden per Rotation gedreht; ihre lokale +Z-Achse zeigt von der Wand weg.
# Rotes Gehäuse
$summon block_display ~ ~ ~ {Tags:["brandschutz.teil"],Rotation:[$(yaw)f,0f],block_state:{id:"minecraft:red_concrete"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.2f,-0.2f,0f],scale:[0.4f,0.4f,0.12f]}}
# Weißes Feld
$summon block_display ~ ~ ~ {Tags:["brandschutz.teil"],Rotation:[$(yaw)f,0f],block_state:{id:"minecraft:white_concrete"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.13f,-0.13f,0.12f],scale:[0.26f,0.26f,0.01f]}}
# Knopf in der Mitte
$summon block_display ~ ~ ~ {Tags:["brandschutz.teil"],Rotation:[$(yaw)f,0f],block_state:{id:"minecraft:black_concrete"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.05f,-0.05f,0.13f],scale:[0.1f,0.1f,0.03f]}}
summon interaction ^ ^-0.2 ^0.2 {Tags:["brandschutz.geraet","brandschutz.knopf"],width:0.45f,height:0.4f,response:true}
playsound minecraft:block.copper.place block @a ~ ~ ~ 1 1
scoreboard players set #ok brandschutz 1
