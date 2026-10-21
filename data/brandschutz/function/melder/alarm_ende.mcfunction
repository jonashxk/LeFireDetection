tag @s remove brandschutz.alarm
data modify entity @e[type=block_display,tag=brandschutz.led,distance=..0.6,sort=nearest,limit=1] block_state.id set value "minecraft:lime_concrete"
title @a[distance=..48] actionbar {text:"✔ Alarm beendet.",color:"green"}
