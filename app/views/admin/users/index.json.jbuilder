json.array!(@items) do |item|
  json.extract! item, :category_id, :title, :cover_image, :description, :briefing, :price, :stock
  json.url item_url(item, format: :json)
end
