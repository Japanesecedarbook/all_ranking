# README

# なんでもランキング
- 好きなランキングを投稿できるサイトです。
<img width="1439" alt="スクリーンショット 2020-08-05 3 01 41" src="https://user-images.githubusercontent.com/66351057/89328351-3c330000-d6c8-11ea-950e-c5e551bdf049.png">

## 主な使用言語
- Haml
- SCSS
- Ruby
- JavaScript

# 機能紹介
- 新規会員登録・ログインをするとランキングを投稿、コメント、いいねできます。
- 新規会員登録、ログインがお済みでない方もランキングを閲覧可能です。
- ゲストログインをする事で、新規会員登録せずとも機能を確認することができます。

# 本番環境
- URL:http://3.113.254.104/
- テストユーザー（一人目）
  - ユーザー名:testuser1
  - メールアドレス:testuser1@test.com
  - パスワード:test1test1
- テストユーザー（二人目）
  - ユーザー名:testuser2
  - メールアドレス:testuser2@test.com
  - パスワード:test2test2

# 制作背景
- 友達や職場の方々とコミュニケーションが取れるアプリケーションを制作したいと思い作成しました。

# 工夫したポイント
- いいね数でのランキングを表示できる様にしました。
- ランキング名を選択するとコメントが見える様にしました。

# 今後追加実装したい機能
- いいね機能がajax化されていない為、ajax化したいです。
- ユーザーページ実装。
- 検索の種類を増やす。

# DB設計
## ER図
<img width="815" alt="スクリーンショット 2020-08-05 4 22 00" src="https://user-images.githubusercontent.com/66351057/89335638-41497c80-d6d3-11ea-9707-dbe41d707d75.png">

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :rankings
- has_many :likes, dependent: :destroy
- has_many :comments

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
- has_many :comments, dependent: :destroy

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|ranking|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :ranking, counter_cache: :likes_count

## Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer||
|ranking_id|integer||

### Association
- belongs_to :user
- belongs_to :ranking
