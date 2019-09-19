class User < ApplicationRecord
  validates_presence_of :email
  validates :password, confirmation: true
  has_secure_password

  after_create :new_api_key

  def new_api_key
    update(api_key: SecureRandom.hex)
  end
end
