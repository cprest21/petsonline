json.array!(@owners) do |owner|
  json.extract! owner, :id, :address_id, :user_id, :name, :lastname
  json.url owner_url(owner, format: :json)
end
