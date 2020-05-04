# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
---------------------------------------
## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true, index: true|
|password|string|null: false, unique: true, index: true|
|family_name|string|null: false|
|given_name|string|null: false|
|family_name_kana|string|null: false|
|given_name_kana|string|null: false|
|birthday|data|null: false|
|postal_code|integer|null|
|prefectures|string|null|
|city|string|null|
|address|string|null|
|building|string|null|

### Association
- belongs_to: credit_card
- belongs_to: address
- has_many: evaluation
- has_many: products
---------------------------------------

---------------------------------------
## Credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|string|null: false|
|expiration_month|string|null: false|
|expiration_year|string|null: false|
|security_code|string|null: false|
|user_id|references|foreign_key: true|

### Association
- belongs_to :user
---------------------------------------

---------------------------------------
## Addressesテーブル

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|given_name|string|null: false|
|family_name_kana|string|null: false|
|given_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|null|
|phone_number|integer|null|
|user_id|references|foreign_key: true|

### Association
- belongs_to :user
---------------------------------------

---------------------------------------
## Evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|evaluation|string|null: false|
|user_id|references|foreign_key: true|

### Association
- belongs_to :user
---------------------------------------

---------------------------------------
## Productsテーブル

|Column|Type|Options|
|------|----|-------|
|product_name|string|null: false|
|product_explanation|text|null: false|
|category|integer|null: false, index: true||
|brand|integer|null: false, index: true||
|product_status|integer|null: false|
|delivery_cost|integer|null: false|
|shipping_origin|integer|null: false|
|delivery_day|integer|null: false|
|price|integer|null: false|
|user_id|references|foreign_key: true|
|buyer|integer|null|

### Association
- belongs_to :user
- has_many :images
---------------------------------------

---------------------------------------
## Imagesテーブル

|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|product_id|references|foreign_key: true|

### Association
- belongs_to :product
---------------------------------------