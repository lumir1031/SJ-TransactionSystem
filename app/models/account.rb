class Account < ApplicationRecord
  has_one :wallet

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.alphanumeric(10)
  end

end
