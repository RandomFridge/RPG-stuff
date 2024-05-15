#> main:tick
# ゲームの核となる処理群

## 戦闘のtick処理
    function main:combat/tick

## ステータスのtick処理
    execute as @p run function status:tick/

## Mob関連のtick処理
    function mobs:tick

## 採取のtick処理
    function main:collect/tick

## 手工のtick処理
    execute as @p at @s if entity @e[tag=craft,distance=..6] run function main:craft/tick

## GUIのtick処理
    execute as @p at @s run function main:social/ui/tick

## HUDのtick処理
    function hud:tick

## (チョットは マシナ みた目に なったカナ?)
