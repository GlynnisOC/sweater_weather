class User < ApplicationRecord
  validates_presence_of :email
  validates :password, confirmation: true
  has_secure_password

  after_initialize :api_key

  def api_key
    self.update(api_key: SecureRandom.hex)
  end
end
