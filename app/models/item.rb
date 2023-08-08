class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :fee
    belongs_to :region
    belongs_to :shipping_day
    has_one_attached :image
    

  validates :name,            presence: true
  validates :description,     presence: true
  validates :category_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :fee_id,          numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_id,       numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,           presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :image,           presence: true
end
