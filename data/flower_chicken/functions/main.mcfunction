#Set new flower chicken
execute as @e[type=minecraft:chicken,tag=!NewFlowerChick,tag=!FlowerChick] at @s if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:flowering_azalea",Count:1b}},distance=..0.75,limit=1] run tag @s add NewFlowerChick
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:flowering_azalea"}}] at @s run tag @e[tag=NewFlowerChick,tag=!FlowerChick,distance=..0.75,limit=1] add FlowerChick
execute as @e[tag=FlowerChick,tag=NewFlowerChick] run function flower_chicken:_set_new_flower_chicken
execute as @e[tag=NewFlowerChick] run scoreboard players operation @s FlowerChickID = _new FlowerChickID
execute as @e[tag=NewFlowerChick] run tag @s remove NewFlowerChick

#Teleport equipment
execute as @e[tag=FlowerChickEquip] at @e[tag=FlowerChick] if score @s FlowerChickID = @e[tag=FlowerChick,limit=1,distance=..0.15,sort=nearest] FlowerChickID run tp @s ~ ~-0.15 ~ ~ 0

#Initialize _new when entity no exist
execute unless entity @e[tag=FlowerChick] run scoreboard players set _new FlowerChickID 0

#Remove equipment when flower chicken no exist
execute as @e[tag=FlowerChickEquip] at @s unless entity @e[tag=FlowerChick,limit=1,distance=..0.15,sort=nearest] run kill @s