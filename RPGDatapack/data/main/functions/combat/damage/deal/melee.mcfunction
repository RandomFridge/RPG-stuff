# 近接攻撃
    tag @s add hurt.melee
# 耐久を減らす
    execute as @p if entity @s[nbt={SelectedItem:{tag:{Customnbt:{Unbreakable:0b,weapon:1b}}}},gamemode=!creative] unless data entity @s SelectedItem{tag:{Customnbt:{weaponType:"wand"}}} run function items:durability/remove
# からの攻撃力を検出して計算式へ
    #剣の薙ぎ払い
    execute if data entity @p SelectedItem{tag:{Customnbt:{weaponType:"sword"}}} if score @p dealtDamage matches 100..149 at @s run function main:combat/attack/range_attack/sweep
    #ハンマーの衝撃
    execute if data entity @p SelectedItem{tag:{Customnbt:{weaponType:"hammer"}}} if score @p dealtDamage matches 100..149 at @s run function main:combat/attack/range_attack/impact
    #短剣の突き
    execute if data entity @p SelectedItem{tag:{Customnbt:{weaponType:"dagger"}}} if score @p dealtDamage matches 100..149 at @s run function main:combat/attack/range_attack/stab

# ダメージ計算
    #属性を取得
    execute store result score $mainElement buffer run data get entity @p SelectedItem.tag.Customnbt.Element.Type
    execute store result score $sideElement buffer run data get entity @p Inventory[{Slot:-106b,tag:{Customnbt:{offhandOnly:1b}}}].tag.Customnbt.Element.Type
    execute unless score $mainElement buffer matches 0 if score $sideElement buffer matches 0 run scoreboard players operation $damageType buffer = $mainElement buffer
    execute if score $mainElement buffer matches 0 unless score $sideElement buffer matches 0 run scoreboard players operation $damageType buffer = $sideElement buffer
    #会心攻撃の処理
    execute as @p if score @s dealtDamage matches 150.. run function main:combat/attack/crit/
    execute as @p run function status:update/
    scoreboard players operation @p atkBuffer = @p atk
    scoreboard players operation @p atkBuffer *= @p dealtDamage
    scoreboard players operation @p atkBuffer /= $100 const
    scoreboard players operation @s damage = @p atkBuffer
    function main:combat/damage/calc/
    execute as @e[tag=hurt_skill] run function main:combat/damage/calc/
# リセット
    data remove storage combat: data.Damage
    tag @p remove attack.crit
    scoreboard players reset @p dealtDamage
