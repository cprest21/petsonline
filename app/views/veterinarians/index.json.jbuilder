json.array!(@veterinarians) do |veterinarian|
  json.extract! veterinarian, :id, :address_id, :name, :lastname
  json.url veterinarian_url(veterinarian, format: :json)
end
