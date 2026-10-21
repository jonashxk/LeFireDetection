# /function brandschutz:probealarm
# Löst alle Rauchmelder (und damit ihre Sprinkler) im Umkreis des ausführenden Spielers aus.
scoreboard players set #grund brandschutz 1
execute store result score #dauer brandschutz run data get storage brandschutz:config probe_dauer
data modify storage brandschutz:tmp m set value {}
data modify storage brandschutz:tmp m.radius set from storage brandschutz:config probe_radius
function brandschutz:alarm/umkreis with storage brandschutz:tmp m

tellraw @s [{text:"[Brandschutz] ",color:"gold"},{text:"Probealarm: ",color:"yellow"},{score:{name:"#anz",objective:"brandschutz"},color:"white"},{text:" Rauchmelder ausgelöst. Beenden: ",color:"gray"},{text:"/function brandschutz:alarm_aus",color:"yellow",click_event:{action:"suggest_command",command:"/function brandschutz:alarm_aus"}}]
