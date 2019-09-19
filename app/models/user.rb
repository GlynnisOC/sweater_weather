class User < ApplicationRecord
  validates_presence_of :email
  validates :password, confirmation: true
  has_secure_password

  before_create :new_api_key

  def new_api_key
    self.api_key = SecureRandom.hex
  end
end
