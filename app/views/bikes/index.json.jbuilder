json.array!(@bikes) do |bike|
  json.extract! bike, :id, :description, :price, :days, :image_url
  json.url bike_url(bike, format: :json)
end
