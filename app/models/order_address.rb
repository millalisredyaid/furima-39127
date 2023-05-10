class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :street, :building, :phone, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :street
    # validates :phone, format: {with: /\A\d{10}$|^\d{11}\z/, message: "is invalid"}
    validates :phone, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }
    validates :token
  end


  
  def save
      order = Order.create(item_id: item_id, user_id: user_id)

      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone: phone, order_id: order.id)
    end 

end
