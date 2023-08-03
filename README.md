# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users

| Column             | Type   | Options             |
| ------------------ | ------ | ------------------- |
| nickname           | string | null: false         |
| email              | string | null: false ,unique: true |
| encrypted_password | string | null: false         |
| last_name          | string | null: false         |
| first_name         | string | null: false         |
| last_name_kana     | string | null: false         |
| first_name_kana    | string | null: false         |
| birthdate          | date   | null: false         |

### Association
has_many :items
has_many :orders



## items

| Column             | Type   | Options             |
| ------------------ | ------ | ------------------- |
| name               | string | null: false         |
| description        | text   | null: false         |
| category_id        | integer| null: false         |
| condition_id       | integer| null: false         |
| fee_id             | integer| null: false         |
| region_id          | integer| null: false         |
| shipping_day_id    | integer| null: false         |
| price              | integer| null: false         |
| user               | references| null: false,foreign_key: true |

### Association
belongs_to :user
has_one :order


## orders

| Column | Type      | Options                       |
| ------ | --------- | ----------------------------- |
| user   | references| null: false,foreign_key: true |
| item   | references| null: false,foreign_key: true |

### Association
belongs_to :user
belongs_to :item
belongs_to :shipping_detail



## shipping_details

| Column             | Type     | Options             |
| ------------------ | -------- | ------------------- |
| postal_code        | string   | null: false         |
| region             |references| null: false,foreign_key: true       |
| city               | string   | null: false         |
| address_line       | string   | null: false         |
| building_name      | string   |                     |
| phone_number       | string   | null: false         |
| order              |references| null: false,foreign_key: true|
### Association
has_one :order