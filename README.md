# テーブル設計

## users テーブル
| Column              | Type    | Options                  |
| ------------------- | ------- | ------------------------ |
| email               | string  | null: false unique: true |
| encrypted_password  | string  | null: false              |
| name                | string  | null: false              |
| family_name         | string  | null: false              |
| first_name          | string  | null: false              |
| family_name_k       | string  | null: false              |
| first_name_k        | string  | null: false              |
| birthday            | date    | null: false              |

### Association
- has_many :items
- has_many :buys


## items テーブル
| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| title              | string     | null: false                   |
| explanation        | text       | null: false                   |
| category_id        | integer    | null: false                   |
| quality_id         | integer    | null: false                   |
| delivery_charge_id | integer    | null: false                   |
| source_id          | integer    | null: false                   |
| number_of_days_id  | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false foreign_key: true |

### Association
- belongs_to :user
- has_one :buy


## destinations テーブル
| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| post_code_id           | integer    | null: false                   |
| prefecture_id          | integer    | null: false                   |
| city                   | string     | null: false                   |
| street_address         | string     | null: false                   |
| building_name          | string     |                               |
| telephone_number       | string     | null: false                   |
| buy                    | references | null: false foreign_key: true |

### Association
- belongs_to :buy


## buys テーブル
| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| user                   | references | null: false foreign_key: true |
| item                   | references | null: false foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :destination

itemの購入記録は１つのみ
userの購入記録はたくさんあっていい