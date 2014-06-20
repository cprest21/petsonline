json.array!(@treatments) do |treatment|
  json.extract! treatment, :id, :veterinarian_id, :treatment_date
  json.url treatment_url(treatment, format: :json)
end
