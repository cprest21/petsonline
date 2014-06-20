json.array!(@pets_losses) do |pets_loss|
  json.extract! pets_loss, :id, :loss_history_no, :pet_id, :loss_id
  json.url pets_loss_url(pets_loss, format: :json)
end
