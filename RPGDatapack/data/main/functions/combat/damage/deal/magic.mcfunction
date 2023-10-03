# 魔術攻撃
    tag @s add hurt.magic
# リセット
    scoreboard players reset @p dealtDamage
# ダメージを取得
    scoreboard players operation @s damage = @e[tag=magic,sort=nearest,limit=1] mag
# 属性を取得
    execute store result score $mainElement buffer run data get entity @e[tag=magic,sort=nearest,limit=1] item.tag.data.Element.Type[0]
    execute store result score $sideElement buffer run data get entity @e[tag=magic,sort=nearest,limit=1] item.tag.data.Element.Type[1]
    execute unless score $mainElement buffer matches 0 if score $sideElement buffer matches 0 run scoreboard players operation $damageType buffer = $mainElement buffer
    execute if score $mainElement buffer matches 0 unless score $sideElement buffer matches 0 run scoreboard players operation $damageType buffer = $sideElement buffer
# 演出
    particle enchanted_hit ~ ~ ~ 0.1 0.1 0.1 0.5 25
    particle crit ~ ~ ~ 0.1 0.3 0.1 0.5 25
    playsound block.amethyst_cluster.place hostile @p ~ ~ ~ 1 0.75
    execute if score $damageType buffer matches 1 run playsound entity.firework_rocket.large_blast hostile @p ~ ~ ~ 0.5 1
    execute if score $damageType buffer matches 1 run playsound entity.player.hurt_on_fire hostile @p ~ ~ ~ 0.5 1
    execute if score $damageType buffer matches 2 run playsound entity.firework_rocket.blast hostile @p ~ ~ ~ 0.5 2
    execute if score $damageType buffer matches 2 run playsound entity.player.hurt_freeze hostile @p ~ ~ ~ 0.5 1
    execute if score $damageType buffer matches 3 run playsound entity.wither.shoot player @p ~ ~ ~ 0.4 2
    execute if score $damageType buffer matches 3 run playsound block.grass.break player @p ~ ~ ~ 0.5 1.2
    execute if score $damageType buffer matches 4 run playsound item.trident.hit player @p ~ ~ ~ 0.5 1
    execute if score $damageType buffer matches 4 run playsound entity.firework_rocket.twinkle_far player @p ~ ~ ~ 0.5 2
# 貫通防止
    execute as @e[tag=magic,sort=nearest,limit=1,tag=!multiple_hit] run scoreboard players operation @s flyTimer = @s flyTime
# プレイヤーが近くにいるなら連撃判定のinteraction召喚
    execute at @s if entity @p[distance=..3] unless data entity @s Passengers[{Tags:["atk_combo"]}] run summon interaction ~ ~ ~ {Tags:["atk_combo","atk_combo.init"]}
    execute at @s run ride @e[tag=atk_combo.init,limit=1,sort=nearest,distance=..1] mount @s
    execute on passengers run function main:combat/attack/combo/wand/init
# からの計算
    function main:combat/damage/calc/
