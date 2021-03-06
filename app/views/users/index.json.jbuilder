json.array!(@users) do |user|
  json.extract! user, :id, :email, :encrypted_password, :string, :reset_password_token, :string, :reset_password_sent_at, :datetime, :remember_created_at, :datetime, :sign_in_count, :integer, :current_sign_in_at, :datetime, :last_sign_in_at, :datetime, :current_sign_in_ip, :string, :last_sign_in_ip, :string, :confirmation_token, :string, :confirmed_at, :datetime, :confirmation_sent_at, :datetime, :unconfirmed_email, :string, :failed_attempts, :integer, :unlock_token, :string
  json.url user_url(user, format: :json)
end
