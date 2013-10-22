json.array!(@shipping_addresses) do |shipping_address|
  json.extract! shipping_address, :user_id, :phone, :address, :zip, :note, :primary
  json.url shipping_address_url(shipping_address, format: :json)
end
