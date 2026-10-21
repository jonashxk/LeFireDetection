kill @s
# Falls der Rahmen beim Entfernen ein normales Item fallen lässt: wegräumen
kill @e[type=item,distance=..1.5,nbt={Age:0s,Item:{id:"minecraft:item_frame"}}]
