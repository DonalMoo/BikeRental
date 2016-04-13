json.array!(@orders) do |order|
  json.extract! order, :id, :bike, :price, :days, :total, :bike_id, :profile_id
  json.url order_url(order, format: :json)
end
