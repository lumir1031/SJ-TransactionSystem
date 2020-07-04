class Account < ApplicationRecord
  has_one :wallet

  def user_token
    self.token = SecureRandom.alphanumeric(10)
  end

end
