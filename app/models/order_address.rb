class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :address_postal_code, :address_prefecture, :address_city, :address_street, :address_building, :address_phone, :orders_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    # validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
  
  def save
    def save
      order = Order.create(item_id: item_id, user_id: user_id)
      
      Address.create(postal_code: postal_code, prefecture: prefecture, city: city, street: street, building: building, oeder_id: oeder.id)
    end 
  end

end
