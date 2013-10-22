json.array!(@orders) do |order|
  json.extract! order, :user_id, :price, :shipping_address_id, :shipped, :tracking_number, :via, :note, :cart_id
  json.url order_url(order, format: :json)
end
