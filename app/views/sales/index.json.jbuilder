json.array!(@sales) do |sale|
  json.extract! sale, :id, :pet_id, :price, :sold, :date_sold, :details
  json.url sale_url(sale, format: :json)
end
