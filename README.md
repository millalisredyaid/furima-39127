## ユーザー管理機能

### users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| id              | integer |             |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password_digest | string  | null: false |
| name            | string  |             |
| address         | string  | null: false |
| birth_date      | string  | null: false |


### Association

- has_many :items
- has_many :purchases

## 商品出品機能

### items テーブル

| Column        | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| id           | integer |                                |
| name         | string  | null: false                    |
| description  | text    | null: false                    |
| category_id  | integer | null: false                    |
| condition    | integer | null: false                    |
| shipping_from| integer | null: false                    |
| days_to_ship | integer | null: false                    |
| price        | integer | null: false                    |

### Association

- belongs_to :user
- has_one_attached :image
- has_one :purchase

## 商品購入機能

### purchases テーブル

| Column      | Type     | Options                        |
| ------------| -------- | ------------------------------ |
| id          | integer  |                                |
| user        | referemce | null: false, foreign_key: true |
| item        | referemce | null: false, foreign_key: true |
| postal_code | string   | null: false                    |
| prefecture  | integer  | null: false                    |
| city        | string   | null: false                    |
| address     | string   | null: false                    |
| building    | string   |                                |
| phone       | string   | null: false                    |

### Association

- belongs_to :user
- belongs_to :item, foreign_key: "item_id", class_name: "Item"
