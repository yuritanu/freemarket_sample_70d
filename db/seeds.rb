# 親の設定
lady = Category.create(name: "レディース")
mens = Category.create(name: "メンズ")
baby = Category.create(name: "ベビー・キッズ")

# 子の設定
lady_tops = lady.children.create(name: "トップス")
lady_jacket = lady.children.create(name: "ジャケット/アウター")
lady_pants = lady.children.create(name: "パンツ")

mens_tops = mens.children.create(name: "トップス")
mens_jacket = mens.children.create(name: "ジャケット/アウター")
mens_pants = mens.children.create(name: "パンツ")

baby_lady = baby.children.create(name: "ベビー服(女の子)")
baby_mens = baby.children.create(name: "ベビー服(男の子)")
baby_kids = baby.children.create(name: "男女兼用")

# 孫の設定
lady_tops.children.create([{name: "Tシャツ/カットソー（半袖/袖なし）"}, {name: "Tシャツ/カットソー（七分/長袖）"}, {name: "その他"}])
lady_jacket.children.create([{name: "テーラードジャケット"}, {name: "ノーカラージャケット"}, {name: "Gジャン/デニムジャケット"},{name: "その他"}])
lady_pants.children.create([{name: "デニム/ジーンズ"}, {name:"ショートパンツ"},{name:"その他"}])

mens_tops.children.create([{name: "Tシャツ/カットソー（半袖/袖なし）"}, {name:"Tシャツ/カットソー（七分/長袖）"},{name:"その他"}])
mens_jacket.children.create([{name: "テーラードジャケット"}, {name:"ノーカラージャケット"},{name:"その他"}])
mens_pants.children.create([{name: "デニム/ジーンズ"}, {name:"ワークパンツ/カーゴパンツ"},{name:"その他"}])

baby_lady.children.create([{name: "トップス"}, {name:"アウター"},{name:"その他"}])
baby_mens.children.create([{name: "トップス"}, {name:"アウター"},{name:"その他"}])
baby_kids.children.create([{name: "トップス"}, {name:"アウター"},{name:"その他"}])
