json.array!(@categories) do |category|
  json.extract! category, :title, :parent_category_id, :order, :url
  json.url category_url(category, format: :json)
end
