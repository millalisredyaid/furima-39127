## ユーザー管理機能

### users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false unique: true|
| encrypted_password | string  | null: false |
| family_name     | string  | null: false |
|  given_name     | string  | null: false |
| family_name_kana     | string  | null: false |
| given_name_kana   | string  | null: false |
| birth_date      | date  | null: false |

### Association

- has_many :items
- has_many :orders

## 商品出品機能

### items テーブル

| Column        | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| item_name    | string  | null: false                    |
| item_info    | text    | null: false                    |
| category_id  | integer | null: false                    |
| condition_id | integer | null: false                    |
| shipping_fee_status_id| integer | null: false                    |
| days_to_ship_id | integer | null: false                    |
| price        | integer | null: false                    |
| prefecture_id  | integer  | null: false                    |
| user         | references| null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one_attached :image
- has_one :orders

## 商品購入機能

### orders テーブル

| Column      | Type     | Options                        |
| ------------| -------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

### addresses テーブル

| Column      | Type     | Options                        |
| ------------| -------- | ------------------------------ |
| orders      | references | null: false, foreign_key: true |
| postal_code | string   | null: true                    |
| prefecture_id  | integer  | null: false                    |
| city        | string   | null: false                    |
| street      | string   | null: false                    |
| building    | string   |                                |
| phone       | string   | null: false                    |
| order_id    |          |                                |