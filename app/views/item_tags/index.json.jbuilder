json.array!(@item_tags) do |item_tag|
  json.extract! item_tag, :item_id, :tag_id
  json.url item_tag_url(item_tag, format: :json)
end
