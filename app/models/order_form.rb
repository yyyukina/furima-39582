class OrderForm
    include ActiveModel::Model
    attr_accessor :item_id, :user_id, :postal_code, :region_id, :city, :address_line, :building_name, :phone_number, :token
    
    with_options presence: true do
        validates :user_id
        validates :item_id
        validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
        validates :region_id, numericality: { other_than: 0, message: "can't be blank" }
        validates :city   
        validates :address_line  
        validates :phone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
        validates :token
    end
    

    def save(params,user_id)
        order = Order.create(item_id: params[:item_id].to_i, user_id: user_id)
        ShippingDetail.create(postal_code: postal_code, region_id: region_id, city: city, address_line: address_line, building_name: building_name, phone_number: phone_number, order_id: order.id)
    end
end