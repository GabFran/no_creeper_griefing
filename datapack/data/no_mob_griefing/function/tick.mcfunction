# Decrement explosionCountdown every tick while the value is greater than zero.
# This is the explosionCountdown that determines when mobGriefing will be re-enabled.
execute if score #explosionCountdown explosionCountdown matches 1.. run scoreboard players remove #explosionCountdown explosionCountdown 1

# Whenever a player is within 3 blocks of a creeper reset explosionCountdown to 60
execute as @a[gamemode=survival] at @s if entity @e[type=minecraft:creeper,distance=..3,limit=1] run scoreboard players set #explosionCountdown explosionCountdown 60

# Whenever a player is withing 3 blocks of an explosive projectile (fireball or wither skull) reset explosionCountdown to 60
execute as @a[gamemode=survival] at @s if entity @e[type=minecraft:large_fireball,distance=..3,limit=1] run scoreboard players set #explosionCountdown explosionCountdown 60
execute as @a[gamemode=survival] at @s if entity @e[type=minecraft:wither_skull,distance=..3,limit=1] run scoreboard players set #explosionCountdown explosionCountdown 60

# If explosionCountdown is still counting down (the value is greater than zero)
# disable mobGriefing. Otherwise re-enable mobGriefing.
execute if score #explosionCountdown explosionCountdown matches 1.. run gamerule mobGriefing false
execute unless score #explosionCountdown explosionCountdown matches 1.. run gamerule mobGriefing true
