# Position: Mitte der Deckenunterseite
summon block_display ~ ~ ~ {Tags:["brandschutz.teil"],block_state:{id:"minecraft:smooth_quartz"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.25f,-0.08f,-0.25f],scale:[0.5f,0.08f,0.5f]}}
summon block_display ~ ~ ~ {Tags:["brandschutz.teil"],block_state:{id:"minecraft:light_gray_concrete"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.15f,-0.11f,-0.15f],scale:[0.3f,0.03f,0.3f]}}
summon block_display ~ ~ ~ {Tags:["brandschutz.teil","brandschutz.led"],brightness:{sky:15,block:15},block_state:{id:"minecraft:lime_concrete"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.12f,-0.095f,0.12f],scale:[0.05f,0.02f,0.05f]}}
summon interaction ~ ~-0.3 ~ {Tags:["brandschutz.geraet","brandschutz.melder"],width:0.6f,height:0.3f,response:true}
playsound minecraft:block.copper.place block @a ~ ~ ~ 1 1.2
