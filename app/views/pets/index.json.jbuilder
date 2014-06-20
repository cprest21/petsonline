json.array!(@pets) do |pet|
  json.extract! pet, :id, :breed_id, :name, :owner_id, :birth_date, :colour, :sex, :sterilized, :available_to_breed, :deceased, :death_date
  json.url pet_url(pet, format: :json)
end
