json.array!(@dewormings) do |deworming|
  json.extract! deworming, :id, :name, :treatment_id
  json.url deworming_url(deworming, format: :json)
end
