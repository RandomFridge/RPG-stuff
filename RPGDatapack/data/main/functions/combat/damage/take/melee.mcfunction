# 属性を取得
    execute store result score #mainElement buffer run data get entity @s HandItems[0].components.custom_data.Element.Type
    execute store result score #sideElement buffer run data get entity @s HandItems[1].components.custom_data.Element.Type
    # execute if data entity @s HandItems[0].components.custom_data.Element.Type store result score #damageType buffer run data get entity @s HandItems[0].components.custom_data.Element.Type
    # execute unless data entity @s HandItems[0].components.custom_data.Element.Type if data entity @s HandItems[1].components{custom_data:{offhandOnly:1b}} store result score #damageType buffer run data get entity @s HandItems[1].components.custom_data.Element.Type
# 近接攻撃を受けました
    tag @p add hurt.melee
    scoreboard players operation @p damage = @s atk
