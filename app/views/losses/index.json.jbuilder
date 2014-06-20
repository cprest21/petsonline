json.array!(@losses) do |loss|
  json.extract! loss, :id, :lost, :finder_name, :finder_contact_details, :date_lost, :place_lost, :date_found, :place_found
  json.url loss_url(loss, format: :json)
end
