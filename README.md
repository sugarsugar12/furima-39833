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
| category           | genre_id   | null: false                   |
| quality            | genre_id   | null: false                   |
| delivery_charge    | genre_id   | null: false                   |
| source             | genre_id   | null: false                   |
| number_of_days     | genre_id   | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false foreign_key: true |

### Association
- belongs_to :user
- has_one :buy


## destinations テーブル
| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| post_code              | genre_id   | null: false                   |
| prefectures            | genre_id   | null: false                   |
| city                   | string     | null: false                   |
| street_address         | string     | null: false                   |
| building_name          | text       |                               |
| telephone_number       | string     | null: false                   |
| buy                    | references | null: false foreign_key: true |

### Association
- has_one :buy


## buys テーブル
| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| user                   | references | null: false foreign_key: true |
| item                   | references | null: false foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :destination

itemの購入記録は１つのみ
userの購入記録はたくさんあっていい