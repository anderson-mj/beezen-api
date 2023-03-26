class User < ApplicationRecord
  devise :database_authenticatable, :validatable

  def authenticate(password)
    valid_password?(password)
  end

  def friendly_name
    email.split('@').first
  end
end
