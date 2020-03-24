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

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birth_date|date|null: false|
|tel|integer|null: false, unique: true|
### Association
- has_many :items
- has_many :comments
- has_many :pays

## itemsテーブル 
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|version|text|null: false|
|brand|string||
|condition|string|null: false|
|delivery_select|string|null: false|
|delivery_method_include_fee|string|null: false|
|delivery_method_COD|string|null: false|
|suppliev_region|string|null: false|
|delivery_date|string|null: false|
|price|integer||
|user_id|integer|null: false, foreign_key: true|
|saler_id|integer||
|buyer_id|integer||
|category_id|integer|foreign_key: true|
|size|integer|null: false|
### Association
- belongs_to :user
- has_many :comments
- has_many :photos
- belongs_to :category


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|item_id|integer| foreign_key: true|
|user_id|integer| foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## paysテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
|security_code|integer|null: false|
|user_id|integer| foreign_key: true|
### Association
- belongs_to :user

## photosテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|foreign_key: true|
|url|text|null: false|
### Association
- belongs_to :item

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :items