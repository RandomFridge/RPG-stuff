#ﾀﾋんだんじゃないの～☆
    tellraw @p [{"translate":"debugging.maybehedied"},{"score":{"name": "@s","objective": "add_pt"}}]
    #戦闘経験値加算
    execute if entity @s[team=hostile] run scoreboard players operation @p[tag=attacker] add_pt = @s add_pt
    execute if entity @s[team=hostile] as @p[tag=attacker] run function status:_general/combat/update_xp
    #体力リセット
    scoreboard players set @s hp_ratio 100
    #ﾁﾈ
    execute if entity @s[type=player] run function status:_general/get/update
    playsound entity.arrow.hit_player master @p[tag=attacker] ~ ~ ~ 1 1
    kill @s
