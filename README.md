# README

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true | 
| encrypted_password  | string | null: false               |
| first_name          | string | null: false               |
| last_name           | string | null: false               |
| first_name_furigana | string | null: false               |
| last_name_furigana  | string | null: false               |
| date_of_birth       | date   | null: false               |

### Association
- has_many :items
- has_many :comments
- has_many :item_purchases

## items テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| user             | reference | null: false, foreign_key: true |
| name             | string    | null: false                    |
| introduction     | text      | null: false                    |
| category_id      | integer   | null: false                    |
| condition_id     | integer   | null: false                    |
| delivery_cost_id | integer   | null: false                    |
| prefecture_id    | integer   | null: false                    |
| delivery_days_id | integer   | null: false                    |
| price            | integer   | null: false                    |

### Association
- belongs_to :user
- has_many :comments
- has_one :item_purchase

## comments テーブル

｜Column  | Type      | Options                        |
| ------  | --------- | ------------------------------ |
| user    | reference | null: false, foreign_key: true |
| text    | text      | null: false                    |

### Association
- belongs_to :user
- belongs_to :item

## delivery_destinations テーブル

| Column        | Type      | Options                        |
| --------------| --------- | ------------------------------ |
| item_purchase | reference | null: false, foreign_key: true |            
| postal_code   | integer   | null: false                    |
| prefecture_id | integer   | null: false                    | 
| municipality  | string    | null: false                    |
| address       | string    | null: false                    |
| building      | string    |                                |
| tel           | string    | null: false                    |

### Association
- has_one :item_purchase

## item_purchases テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| user   | reference | null: false, foreign_key: true |
| item   | reference | null: false, foreign_key: true |       

### Association 
- belongs_to :user
- belongs_to :item
- has_one: delivery_destination
