class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :shipping_fee_status
  belongs_to :condition
  

  validates :image, presence: { message: "can't be blank" }
  validates :item_name, presence: { message: "can't be blank" }
  validates :item_name, length: { maximum: 40, message: "is too long (maximum is 40 characters)" }
  validates :item_info, presence: { message: "can't be blank" }
  validates :item_info, length: { maximum: 1000, message: "is too long (maximum is 1000 characters)" }
  validates :item_price, presence: { message: "can't be blank" }
  
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :item_price, 
    numericality: { 
      only_integer: true,
      message: "is invalid. Input half-width characters"
    }
    validates :item_price, 
    numericality: { 
      greater_than_or_equal_to: 300, 
      less_than_or_equal_to: 9_999_999, 
      message: "is out of setting range" 
    }


    
end
