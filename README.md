# README

# 　　　　　　　　　　　　なんでもランキング
- 好きなランキングを投稿できるサイトです。
## 主な使用言語
- Haml
- SCSS
- Ruby
- JavaScript

# 機能紹介
- 新規会員登録・ログインをするとランキングを投稿できます。
- 新規会員登録、ログインがお済みでない方もランキングを閲覧可能です。

# DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :rankings
- has_many :likes, dependent: :destroy


## rankingsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|rank1|string|null: false|
|rank2|string|null: false|
|rank3|string|null: false|
|image|string|null: false|
|user|references|null: false, foreign_key: true|
|likes_count|integer||


### Association
- belongs_to :user
- has_many :likes, dependent: :destroy

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|ranking|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :ranking, counter_cache: :likes_count
