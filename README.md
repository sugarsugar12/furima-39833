# テーブル設計

## users テーブル
| Column              | Type    | Options                  |
| ------------------- | ------- | ------------------------ |
| email               | string  | null: false unique: true |
| password            | string  | null: false              |
| name                | string  | null: false              |
| family_name         | text    | null: false              |
| first_name          | text    | null: false              |
| family_name_k       | text    | null: false              |
| first_name_k        | text    | null: false              |
| birthday            | integer | null: false              |

### Association
- has_many :items
- has_many :buys
- has_many :destinations


## items テーブル
| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| title              | string     | null: false                   |
| explanation        | text       | null: false                   |
| category           | text       | null: false                   |
| quality            | text       | null: false                   |
| delivery_charge    | text       | null: false                   |
| source             | text       | null: false                   |
| number_of_days     | text       | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false foreign_key: true |

### Association
- belongs_to :user
- has_one :buy


## destinations テーブル
| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| post_code              | string     | null: false                   |
| prefectures            | text       | null: false                   |
| city                   | string     | null: false                   |
| street_address         | string     | null: false                   |
| telephone_number       | string     | null: false                   |
| user                   | references | null: false foreign_key: true |

### Association
- belongs_to :user

そのitemの配送先ではなく
そのitemを買ったuserの配送先


## buys テーブル
| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| user                   | references | null: false foreign_key: true |
| item                   | references | null: false foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

itemの購入記録は１つのみ
userの購入記録はたくさんあっていい