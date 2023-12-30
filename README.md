# テーブル設計

## users テーブル
| Column              | Type   | Options                  |
| ------------------- | ------ | ------------------------ |
| email               | string | null: false unique: true |
| encrypted           | string | null: false              |
| name                | string | null: false              |
| family_name         | text   | null: false              |
| first_name          | text   | null: false              |
| family_name_k       | text   | null: false              |
| first_name_k        | text   | null: false              |
| birthday            | text   | null: false              |



### Association
- has_many :prototypes


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
- belongs_to :users
- has_one :destination

## destinations テーブル
| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| post_code              | integer    | null: false                   |
| prefectures            | text       | null: false                   |
| city                   | text       | null: false                   |
| street_address         | text       | null: false                   |
| building_name          | text       | null: false                   |
| telephone_number       | integer    | null: false                   |
| item                   | references | null: false foreign_key: true |

### Association
- belongs_to :item