class UserPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id , :municipality, :address, :building, :tel

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly" }
    validates :prefecture_id, numericality:{ other_than: 1 }
    validates :municipality
    validates :address
    validates :tel, format: { with: /\A\d{10,11}\z/, message: "Input only number" }
  end
  

  def save
    ItemPurchase.create(user_id: user_id, item_id: item_id)
    DeliveryDestination.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, tel: tel)
  end

end