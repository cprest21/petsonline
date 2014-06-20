json.array!(@advertisements) do |advertisement|
  json.extract! advertisement, :id, :user_id, :details, :placement_date
  json.url advertisement_url(advertisement, format: :json)
end
