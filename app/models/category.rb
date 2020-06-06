class Category < ApplicationRecord

  has_many :products
  has_ancestry
end

class Category < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    # メインカテゴリー
    { id: 1, name: 'レディース', sub: '0', sub_sub: '0', size: '', brand: '' },
    { id: 2, name: 'メンズ', sub: '0', sub_sub: '0', size: '', brand: '' },
    { id: 3, name: 'ベビー・キッズ', sub: '0', sub_sub: '0', size: '', brand: '' },
    { id: 4, name: 'インテリア・住まい・小物', sub: '0', sub_sub: '0', size: '', brand: '' },
    { id: 5, name: '本・音楽・ゲーム', sub: '0', sub_sub: '0', size: '', brand: '' },
    { id: 6, name: 'おもちゃ・ホビー・グッズ', sub: '0', sub_sub: '0', size: '', brand: '' },
    { id: 7, name: 'コスメ・香水・美容', sub: '0', sub_sub: '0', size: '', brand: '' },
    { id: 8, name: '家電・スマホ・カメラ', sub: '0', sub_sub: '0', size: '', brand: '' },
    { id: 9, name: 'スポーツ・レジャー', sub: '0', sub_sub: '0', size: '', brand: '' },
    { id: 10, name: 'ハンドメイド', sub: '0', sub_sub: '0', size: '', brand: '' },
    { id: 11, name: 'チケット', sub: '0', sub_sub: '0', size: '', brand: '' },
    { id: 12, name: '自動車・オートバイ', sub: '0', sub_sub: '0', size: '', brand: '' },
    { id: 13, name: 'その他', sub: '0', sub_sub: '0', size: '', brand: '' },
  ]
end
