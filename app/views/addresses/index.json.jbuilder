json.array!(@addresses) do |address|
  json.extract! address, :id, :city_id, :street, :street_no, :apartment_no, :floor, :telephone, :office_no, :building
  json.url address_url(address, format: :json)
end
