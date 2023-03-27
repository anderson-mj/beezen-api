class User < ApplicationRecord
  devise :database_authenticatable, :validatable
  api_guard_associations refresh_token: 'refresh_tokens'
  has_many :refresh_tokens, dependent: :delete_all

  def authenticate(password)
    valid_password?(password)
  end

  def friendly_name
    email.split('@').first
  end
end
