#演出
    playsound entity.player.attack.sweep master @p[tag=attacker] ~ ~ ~ 1 1.5
#ノックバック強化
    scoreboard players operation @s damage = @p[tag=attacker] atkBuffer
    scoreboard players set $kbpowerx buffer 5
    scoreboard players set $kbpowery buffer 10
    scoreboard players set $kbpowerz buffer 5
    execute at @p[tag=attacker] run function main:combat/damage/knockback
#リセット
    scoreboard players reset $kbpowerx buffer
    scoreboard players reset $kbpowery buffer
    scoreboard players reset $kbpowerz buffer
