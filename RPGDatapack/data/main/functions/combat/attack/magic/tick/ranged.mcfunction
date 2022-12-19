#遠距離魔法共通の処理
    #持っている速度タグで速さが変わる
    tp @s[tag=spd.slow] ^ ^ ^0.1
    tp @s[tag=spd.normal] ^ ^ ^0.3
    tp @s[tag=spd.fast] ^ ^ ^1
    #taretタグが付いたEntityがいるならそちらを追尾
    execute at @e[tag=target] unless score @e[limit=1,sort=nearest] playerID = @s playerID at @s facing entity @e[tag=target,limit=1] eyes run tp @s ~ ~ ~ ~ ~
    #当たり判定
    execute unless score @s playerID = @e[limit=1,dx=0,team=hostile,type=!player] playerID as @e[limit=1,dx=0,team=hostile,type=!player] run function main:combat/attack/magic/damage
    #タイマー加算
    scoreboard players add @s flyTimer 1
    #追尾システム(出来ねぇ...)
    execute if score @s flyTimer matches ..20 positioned ^ ^ ^10.1 as @e[distance=..10,team=hostile,sort=nearest,limit=1] positioned as @s positioned ^ ^ ^1000 rotated ~7 ~15 facing entity @e[tag=magic.ranged] eyes positioned ^ ^ ^1000 positioned ~-0.5 ~-0.5 ~-0.5 if entity @s[distance=..2] run tag @s add target
    #時間切れで/kill
    execute if score @s flyTimer >= @s flyTime run kill @s
