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
| email              | string | null: false         |
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
| category           | string | null: false         |
| condition          | string | null: false         |
| fee                | string | null: false         |
| region             | string | null: false         |
| days               | string | null: false         |
| price              | integer| null: false         |
| users_id           | integer| null: false,foreign_key: true |

### Association
belongs_to :user
has_one :order


## orders

| Column        | Type   | Options             |
| ------------- | ------ | ------------------- |
| users_id      | integer| null: false,foreign_key: true |
| items_id      | integer| null: false,foreign_key: true |

### Association
belongs_to :user
has_one :item
has_one :shipping_detail



## shipping_details

| Column             | Type   | Options             |
| ------------------ | ------ | ------------------- |
| postal_code        | string | null: false         |
| prefecture         | string | null: false         |
| city               | string | null: false         |
| address_line       | string | null: false         |
| building_name      | string | null: false         |
| phone_number       | string | null: false         |

### Association
has_one :order