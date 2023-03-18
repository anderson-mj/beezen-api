class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def authenticate(password)
    valid_password?(password)
  end
end
