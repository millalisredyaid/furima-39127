## ユーザー管理機能

### users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| encrypted_password | string  | null: false |
| name            | string  |             |
| birth_date      | string  | null: false |
| created_at      | datetime|             |
| updated_at      | datetime|             |
| reset_password_sent_at| timestamp  | null: true |

### Association

- has_many :items
- has_many :purchases
- belongs_to :user

## 商品出品機能

### items テーブル

| Column        | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| name         | string  | null: false                    |
| description  | text    | null: false                    |
| category_id  | integer | null: false                    |
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
| item        | referemce | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


### addresses テーブル

| Column      | Type     | Options                        |
| ------------| -------- | ------------------------------ |
| user_id     | referemce| null: false, foreign_key: true |
| postal_code | string   | null: false                    |
| prefecture  | integer  | null: false                    |
| city        | string   | null: false                    |
| address     | string   | null: false                    |
| building    | string   |                                |
| phone       | string   | null: false                    |

### Association

- belongs_to :user
- belongs_to :item, foreign_key: "item_id", class_name: "Item"