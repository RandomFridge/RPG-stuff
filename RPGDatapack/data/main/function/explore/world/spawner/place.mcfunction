# 見た目のブロック設置
    function main:explore/world/spawner/place_block with storage explore: data
# スポナートロッコを載せたitem_displayを設置
    execute align xyz run summon item_display ~0.5 ~0.3 ~0.5 {Tags:["spawner","spawner.summon"],Passengers:[{id:"spawner_minecart",SpawnCount:1,CustomDisplayTile:1b,DisplayState:{Name:"air"}}],item:{id:"minecraft:stick",count:1,components:{custom_model_data:1}}}
    execute as @n[type=item_display,tag=spawner.summon,distance=..1] on passengers run function main:explore/world/spawner/set_data
    tag @n[type=item_display,tag=spawner.summon,distance=..1] remove spawner.summon
