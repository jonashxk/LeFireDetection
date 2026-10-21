# #grund: 0 = Feuer erkannt, 1 = Probealarm, 2 = Feueralarm-Knopf
tag @s add brandschutz.alarm
function brandschutz:melder/ton
data modify entity @e[type=block_display,tag=brandschutz.led,distance=..0.6,sort=nearest,limit=1] block_state.id set value "minecraft:red_concrete"
execute if score #grund brandschutz matches 0 run title @a[distance=..48] actionbar [{text:"⚠ Feueralarm! ",color:"red",bold:true},{text:"Rauchmelder hat Feuer erkannt.",color:"gold",bold:false}]
execute if score #grund brandschutz matches 1 run title @a[distance=..48] actionbar [{text:"Probealarm ",color:"yellow",bold:true},{text:"– dies ist nur ein Test.",color:"gray",bold:false}]
execute if score #grund brandschutz matches 2 run title @a[distance=..48] actionbar [{text:"⚠ Feueralarm! ",color:"red",bold:true},{text:"Feueralarm-Knopf wurde gedrückt.",color:"gold",bold:false}]
