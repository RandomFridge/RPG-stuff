# custom_dataの耐久値を減算
    execute store result score @s durability run data get entity @s SelectedItem.components.custom_data.Durability
    scoreboard players remove @s durability 1
    scoreboard players operation #durability buffer = @s durability
    execute store result storage item: Item.components.custom_data.Durability int 1 run scoreboard players get #durability buffer
    item modify entity @s weapon.mainhand main:update_durability
# 0未満なら壊す
    execute if score @s durability matches ..-1 run function items:durability/break
# アイテムの耐久ゲージを更新
    execute store result score @s maxDurability run data get entity @s SelectedItem.components.custom_data.MaxDurability
    scoreboard players operation #maxDurability buffer = @s maxDurability
    scoreboard players operation @s durability *= #384 const
    execute store result score @s dur_ratio run scoreboard players operation @s durability /= @s maxDurability
    scoreboard players set @s buffer 384
    execute store result storage item: data.Damage int 1 run scoreboard players operation @s buffer -= @s dur_ratio
# 代入
    data modify storage item: Item set from entity @s SelectedItem
    item modify entity @s weapon.mainhand main:update_durability_display
    item replace block 0 -59 0 container.0 from entity @s weapon.mainhand
    execute positioned 0 -59 0 run function items:get_data
    item modify entity @s weapon.mainhand items:lore/text
    item modify entity @s weapon.mainhand items:lore/status
    execute if score #enchantcount buffer matches 1.. run function items:set_data/rec_mainhand
    item modify entity @s weapon.mainhand items:lore/info
# リセット
    data remove storage item: data
    data remove storage item: Item
    data modify storage item: Item.Count set value 1b
    scoreboard players reset @s buffer
    scoreboard players reset @s usedBow
    scoreboard players reset @s durability
    scoreboard players reset @s maxDurability
    scoreboard players reset @s dur_ratio
    scoreboard players reset #Lore buffer
    scoreboard players reset #itemType buffer
    scoreboard players reset #heal_amount_hp buffer
    scoreboard players reset #heal_amount_mana buffer
    scoreboard players reset #element buffer
    scoreboard players reset #atkBonus buffer
    scoreboard players reset #magBonus buffer
    scoreboard players reset #dexBonus buffer
    scoreboard players reset #hpBonus buffer
    scoreboard players reset #intBonus buffer
    scoreboard players reset #defBonus buffer
    scoreboard players reset #spdBonus buffer
    scoreboard players reset #crtBonus buffer
    scoreboard players reset #lukBonus buffer
    scoreboard players reset #accBonus buffer
    scoreboard players reset #rarity buffer
    scoreboard players reset #durability buffer
    scoreboard players reset #maxDurability buffer
    scoreboard players reset #enchantcount buffer
    scoreboard players reset #hasAbility buffer
    item replace block 0 -59 0 container.0 with air
