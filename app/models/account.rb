class Account < ApplicationRecord
  has_one :wallet

  before_create :generate_token
  after_create :init_wallet

  def generate_token
    self.token = SecureRandom.alphanumeric(10)
  end

  def init_wallet
    create_wallet(balance: 0)
  end

end
