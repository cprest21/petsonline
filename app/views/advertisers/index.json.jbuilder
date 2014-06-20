json.array!(@advertisers) do |advertiser|
  json.extract! advertiser, :id, :address_id, :user_id, :name, :lastname
  json.url advertiser_url(advertiser, format: :json)
end
