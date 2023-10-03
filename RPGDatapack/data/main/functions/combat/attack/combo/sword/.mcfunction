# 殴られたinteraction特定
    execute store result score $atkTime buffer run time query gametime
    execute at @s as @e[distance=..5,tag=atk_combo] store result score @s timestamp run data get entity @s attack.timestamp
    execute at @s as @e[tag=atk_combo,distance=..5] if score @s timestamp = $atkTime buffer run tag @s add atk_combo.target
# 剣の連撃に変更
    execute as @e[tag=atk_combo.target,limit=1] unless entity @s[tag=atk_combo.sword] run function main:combat/attack/combo/sword/init
# すでに剣なら時間延長
    execute as @e[tag=atk_combo.target,limit=1] if entity @s[tag=atk_combo.sword] run scoreboard players add @s combo_time 10
# 追加でダメージ与える
    execute as @e[tag=atk_combo.target,limit=1] on vehicle run function main:combat/damage/combo
# 連撃回数減らす
    scoreboard players add @e[tag=atk_combo.target,limit=1] combo_count 1
# 演出
    #1回目
    execute as @e[tag=atk_combo.target,limit=1] if score @s combo_count matches 1 on vehicle at @s run function main:combat/attack/combo/sword/1
    #2回目
    execute as @e[tag=atk_combo.target,limit=1] if score @s combo_count matches 2.. on vehicle at @s run function main:combat/attack/combo/sword/2
# リセット
    scoreboard players reset $atkTime buffer
    execute at @s run scoreboard players reset @e[tag=atk_combo,distance=..5] timestamp
    tag @e[tag=atk_combo.target] remove atk_combo.target
    advancement revoke @s only main:combat/attack/combo/sword
