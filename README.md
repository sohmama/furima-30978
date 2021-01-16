# README

## users テーブル

| column        | Type   | Options     |
| ------------- | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false | 
| password      | string | null: false |
| name          | string | null: false |
| furigana      | string | null: false |
| date_of_birth | string | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :transactions

## items テーブル

| column        | Type      | Options                        |
| ------------- | --------- | ------------------------------ |
| user_id       | reference | null: false, foreign_key: true |
| image         |           | null: false                    |
| category      |           | null: false                    |
| condition     |           | null: false                    |
| delivery_cost |           | null: false                    |
| delivery_from |           | null: false                    |
| delivery_days |           | null: false                    |

### Association
- belongs_to :user
- has_many :comments
- has_one :transaction

## comments テーブル

｜column  | Type      | Options                        |
| ------  | --------- | ------------------------------ |
| user_id | reference | null: false, foreign_key: true |
| text    | text      | null: false                    |

### Association
- belongs_to :user
- belongs_to :item

## transactions テーブル

| column     | Type      | Options                        |
| -----------| --------- | ------------------------------ |
| user_id    | reference | null: false, foreign_key :true |
| address    | text      | null: false                    |
| tel        | string    | null: false                    |

### Association
- belongs_to :user
- belongs_to :item
