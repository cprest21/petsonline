json.array!(@vaccination_types) do |vaccination_type|
  json.extract! vaccination_type, :id, :name, :treatment_id
  json.url vaccination_type_url(vaccination_type, format: :json)
end
