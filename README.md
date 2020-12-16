# テーブル設計

## users テーブル

| Column               | Type     | Options        |
| -------------------- | -------- | -------------- |
| nickname             | string   | null: false    |
| email                | string   | null: false    |
| encrypted_password   | string   | null: false    |
| first_name           | string   | null: false    |
| last_name            | string   | null: false    |
| first_name_furigana  | string   | null: false    |
| last_name_furigana   | string   | null: false    |
| birthday             | date     | null: false    |

### Association
- has many :items
- has many :orders

## items テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| name            | string     | null: false       |
| text            | string     | null: false       |
| condition_id    | integer    | null: false       |
| price           | integer    | null: false       |
| category_id     | integer    | null: false       |
| postage_id      | integer    | null: false       |
| sipping_area_id | integer    | null: false       |
| sipping_date_id | integer    | null: false       |
| user            | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ------------------|
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| house_number  | string     | null: false       |
| bulling       | string     |                   |
| phone_number  | string     | null: false       |
| order         | references | foreign_key: true |

### Association
- belongs_to :order