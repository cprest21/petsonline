json.array!(@pet_treatments) do |pet_treatment|
  json.extract! pet_treatment, :id, :medical_history_no, :pet_id, :treatment_id
  json.url pet_treatment_url(pet_treatment, format: :json)
end
