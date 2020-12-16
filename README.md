# テーブル設計

## users テーブル

| Column               | Type     | Options        |
| -------------------- | -------- | -------------- |
| nickname             | string   | null: false    |
| email                | string   | null: false    |
| password             | string   | null: false    |
| first_name           | string   | null: false    |
| last_name            | string   | null: false    |
| first_name_furigana  | string   | null: false    |
| last_name_furigana   | string   | null: false    |
| birthday             | integer  | null: false    |

### Association
- has many :items
- has many :orders

## items テーブル

| Column         | Type       | Options           |
| ---------------| ---------- | ----------------- |
| name           | string     | null: false       |
| text           | string     | null: false       |
| condition      | string     | null: false       |
| price          | integer    | null: false       |
| category       | string     | null: false       |
| postage        | string     | null: false       |
| sipping_area   | string     | null: false       |
| sipping_date   | string     | null: false       |
| user           | references | foreign_key: true |

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

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| postal_code  | integer    | null: false       |
| prefecture   | string     | null: false       |
| city         | string     | null: false       |
| house_number | string     | null: false       |
| bulling      | string     |                   |
| phone_number | integer    | null: false       |
| order        | references | foreign_key: true |

### Association
- belongs_to :order