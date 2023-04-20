## ユーザー管理機能

### users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password_digest | string  | null: false |
| name            | string  |             |
| address         | string  | null: false |
| birth_date      | string  | null: false |
| created_at      | datetime|             |
| updated_at      | datetime|             |
| reset_password_sent_at| timestamp  | null: true |

### Association

- has_many :items
- has_many :purchases

## 商品出品機能

### items テーブル

| Column        | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| name         | string  | null: false                    |
| description  | text    | null: false                    |
| category_id  | integer | null: false, foreign_key: true                    |
| condition    | integer | null: false                    |
| shipping_from| integer | null: false                    |
| days_to_ship | integer | null: false                    |
| price        | integer | null: false                    |
| shipping_to  | integer | null: false                    |
| user_id      | reference| null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one_attached :image
- has_one :purchase

## 商品購入機能

### purchases テーブル

| Column      | Type     | Options                        |
| ------------| -------- | ------------------------------ |
| user_id     | referemce | null: false, foreign_key: true |
| item_id     | referemce | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

### addresses テーブル

| Column      | Type     | Options                        |
| ------------| -------- | ------------------------------ |
| user_id     | referemce| null: false, foreign_key: true |
| postal_code | string   | null: false                    |
| prefecture  | string   | null: false                    |
| city        | string   | null: false                    |
| address     | string   | null: false                    |
| house_number| string   | 
| building    | string   |                                |
| phone       | string   | null: false                    |

### Association

- belongs_to :user
- has_many :purchase_addresses
- has_many :purchases, through: :purchase_addresses

### purchase_addressesテーブル

| Column       | Type     | Options                        |
| ------------ | -------- | ------------------------------ |
| purchase_id  | reference| null: false, foreign_key: true |
| address_id   | reference| null: false, foreign_key: true |

### Association

- has_many :purchase_addresses
- has_one :address, through: :purchase_addresses
