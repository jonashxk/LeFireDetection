# Position: Mitte der Deckenunterseite
summon block_display ~ ~ ~ {Tags:["brandschutz.teil"],block_state:{id:"minecraft:lightning_rod",properties:{facing:"down"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.3f,-0.6f,-0.3f],scale:[0.6f,0.6f,0.6f]}}
summon block_display ~ ~ ~ {Tags:["brandschutz.teil"],block_state:{id:"minecraft:iron_block"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.15f,-0.62f,-0.15f],scale:[0.3f,0.03f,0.3f]}}
summon block_display ~ ~ ~ {Tags:["brandschutz.teil"],block_state:{id:"minecraft:red_concrete"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.06f,-0.25f,-0.06f],scale:[0.12f,0.12f,0.12f]}}
summon interaction ~ ~-0.6 ~ {Tags:["brandschutz.geraet","brandschutz.sprinkler"],width:0.5f,height:0.6f,response:true}
playsound minecraft:block.copper.place block @a ~ ~ ~ 1 1
