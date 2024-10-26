# 仮ストレージに内容コピー
    data modify storage temp: loot set from block ~ ~ ~ Items
# 耐久値のないアイテムを削除
    data remove storage temp: loot[{components:{"minecraft:custom_data":{has_durability:false}}}]
# 耐久値のあるアイテムは予め設定
    execute if data storage temp: loot[0] run function main:explore/world/chest/load_durability
# アイテムを置き換える
    function #asset:item/loot/load
# 初めて開けるなら進行度に加算
    execute if entity @s[tag=!explore.chest.discovered] run function main:explore/world/chest/open_new with entity @s data
# opnenedタグ付与
    tag @s add explore.chest.opened
# discoveredタグ付与
    tag @s add explore.chest.discovered
# リセット
    data remove storage temp: loot
