class User < ApplicationRecord
  validates_presence_of :email, :api_key
  validates :password, confirmation: true
  has_secure_password

end
