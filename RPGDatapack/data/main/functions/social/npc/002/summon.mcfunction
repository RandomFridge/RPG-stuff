#それではご覧ください！普通の村人、ID-002です！
#取引内容
    data modify storage npc: Data.Offers.Recipes set value [{},{},{},{},{},{},{}]
    data modify storage npc: Data.Offers.Recipes[0] set value {buy:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{CustomModelData:8998,Customnbt:{id:"purse"},display:{Name:'{"italic":false,"color":"white","translate":"item.purse"}',Lore:['{"italic":false,"color":"white","translate":"item.purse.lore"}','{"text":" "}','{"bold":true,"italic":false,"color":"white","translate":"item.ui.rarity.common"}']}}},sell:{id:"minecraft:stick",Count:1b,tag:{CustomModelData:1203,display:{Name:'[{"translate":"item.golden_wand","italic":false,"color":"green"},{"text":"   65","color":"gold","italic":false}]'}}},maxUses:2147483647,rewardExp:0b}
    data modify storage npc: Data.Offers.Recipes[1] set value {buy:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{CustomModelData:8998,Customnbt:{id:"purse"},display:{Name:'{"italic":false,"color":"white","translate":"item.purse"}',Lore:['{"italic":false,"color":"white","translate":"item.purse.lore"}','{"text":" "}','{"bold":true,"italic":false,"color":"white","translate":"item.ui.rarity.common"}']}}},sell:{id:"minecraft:stick",Count:1b,tag:{CustomModelData:1204,display:{Name:'[{"translate":"item.diamond_wand","italic":false,"color":"blue"},{"text":"   175","color":"gold","italic":false}]'}}},maxUses:2147483647,rewardExp:0b}
    data modify storage npc: Data.Offers.Recipes[2] set value {buy:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{CustomModelData:8998,Customnbt:{id:"purse"},display:{Name:'{"italic":false,"color":"white","translate":"item.purse"}',Lore:['{"italic":false,"color":"white","translate":"item.purse.lore"}','{"text":" "}','{"bold":true,"italic":false,"color":"white","translate":"item.ui.rarity.common"}']}}},sell:{id:"minecraft:stick",Count:1b,tag:{CustomModelData:1206,display:{Name:'[{"translate":"item.amethyst_wand","italic":false,"color":"dark_purple"},{"text":"   550","color":"gold","italic":false}]'}}},maxUses:2147483647,rewardExp:0b}
    data modify storage npc: Data.Offers.Recipes[3] set value {buy:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{CustomModelData:8998,Customnbt:{id:"purse"},display:{Name:'{"italic":false,"color":"white","translate":"item.purse"}',Lore:['{"italic":false,"color":"white","translate":"item.purse.lore"}','{"text":" "}','{"bold":true,"italic":false,"color":"white","translate":"item.ui.rarity.common"}']}}},sell:{id:"minecraft:stick",Count:1b,tag:{CustomModelData:2000,display:{Name:'[{"translate":"item.fire_ring","italic":false,"color":"blue"},{"text":"   200","color":"gold","italic":false}]'}}},maxUses:2147483647,rewardExp:0b}
    data modify storage npc: Data.Offers.Recipes[4] set value {buy:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{CustomModelData:8998,Customnbt:{id:"purse"},display:{Name:'{"italic":false,"color":"white","translate":"item.purse"}',Lore:['{"italic":false,"color":"white","translate":"item.purse.lore"}','{"text":" "}','{"bold":true,"italic":false,"color":"white","translate":"item.ui.rarity.common"}']}}},sell:{id:"minecraft:stick",Count:1b,tag:{CustomModelData:2001,display:{Name:'[{"translate":"item.ice_ring","italic":false,"color":"blue"},{"text":"   200","color":"gold","italic":false}]'}}},maxUses:2147483647,rewardExp:0b}
    data modify storage npc: Data.Offers.Recipes[5] set value {buy:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{CustomModelData:8998,Customnbt:{id:"purse"},display:{Name:'{"italic":false,"color":"white","translate":"item.purse"}',Lore:['{"italic":false,"color":"white","translate":"item.purse.lore"}','{"text":" "}','{"bold":true,"italic":false,"color":"white","translate":"item.ui.rarity.common"}']}}},sell:{id:"minecraft:stick",Count:1b,tag:{CustomModelData:2002,display:{Name:'[{"translate":"item.thunder_ring","italic":false,"color":"blue"},{"text":"   200","color":"gold","italic":false}]'}}},maxUses:2147483647,rewardExp:0b}
    data modify storage npc: Data.Offers.Recipes[6] set value {buy:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{CustomModelData:8998,Customnbt:{id:"purse"},display:{Name:'{"italic":false,"color":"white","translate":"item.purse"}',Lore:['{"italic":false,"color":"white","translate":"item.purse.lore"}','{"text":" "}','{"bold":true,"italic":false,"color":"white","translate":"item.ui.rarity.common"}']}}},sell:{id:"minecraft:stick",Count:1b,tag:{CustomModelData:2003,display:{Name:'[{"translate":"item.wind_ring","italic":false,"color":"blue"},{"text":"   200","color":"gold","italic":false}]'}}},maxUses:2147483647,rewardExp:0b}
    summon villager ~ ~ ~ {NoAI:1b,VillagerData:{level:2147483647,profession:"librarian"},Tags:["npc.002"]}
    data modify entity @e[tag=npc.002,limit=1,sort=nearest] Offers set from storage npc: Data.Offers
    data remove storage npc: Data
