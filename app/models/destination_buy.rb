class DestinationBuy
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street_address, :building_name, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)'}
    validates :prefecture_id
    validates :city
    validates :street_address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only numbers'}
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  
  def save
    buy = Buy.create(item_id: item_id, user_id: user_id) 
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building_name: building_name, telephone_number: telephone_number, buy_id: buy.id)
  end
end