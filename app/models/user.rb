class User < ApplicationRecord
  validates_presence_of :email
  validates :password, confirmation: true
  has_secure_password

  after_initialize :create_api_key

  def create_api_key
    update(api_key: SecureRandom.hex)
  end
end
