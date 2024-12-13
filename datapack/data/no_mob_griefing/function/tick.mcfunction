# Decrement explosionCountdown every tick while the value is greater than zero.
# This is the explosionCountdown that determines when mobGriefing will be re-enabled.
execute if score #explosionCountdown explosionCountdown matches 1.. run scoreboard players remove #explosionCountdown explosionCountdown 1

# Whenever a player in survival is within 3 blocks of a creeper reset explosionCountdown to 60 (3 seconds)
execute as @a[gamemode=survival] at @s if entity @e[type=minecraft:creeper,distance=..3,limit=1] run scoreboard players set #explosionCountdown explosionCountdown 60

# Whenever a player is within 5 blocks of a wither reset explosionCountdown to 240 (12 seconds)
execute as @a at @s if entity @e[type=minecraft:wither,distance=..5,limit=1] run scoreboard players set #explosionCountdown explosionCountdown 240

# Whenever a shooty boi is within 3 blocks of a creeper reset explosionCountdown to 60 (3 seconds)
execute as @a at @e[type=#no_mob_griefing:shooty_bois] if entity @e[type=minecraft:creeper,distance=..3,limit=1] run scoreboard players set #explosionCountdown explosionCountdown 60 

# Whenever a wither skull is shot, reset explosionCountdown to 100 (5 seconds)
execute as @a at @e[type=minecraft:wither] if entity @e[type=minecraft:wither_skull,distance=..3,limit=1] run scoreboard players set #explosionCountdown explosionCountdown 100

# Whenever a small fireball is shot, reset explosionCountdown to 100 (5 seconds)
execute as @a at @e[type=minecraft:blaze] if entity @e[type=minecraft:small_fireball,distance=..3,limit=1] run scoreboard players set #explosionCountdown explosionCountdown 200

# Whenever a fireball is shot, reset explosionCountdown to 200 (10 seconds)
execute as @a at @e[type=minecraft:ghast] if entity @e[type=minecraft:fireball,distance=..3,limit=1] run scoreboard players set #explosionCountdown explosionCountdown 200

# If explosionCountdown is still counting down (the value is greater than zero)
# disable mobGriefing. Otherwise re-enable mobGriefing.
execute if score #explosionCountdown explosionCountdown matches 1.. run gamerule mobGriefing false
execute unless score #explosionCountdown explosionCountdown matches 1.. run gamerule mobGriefing true
