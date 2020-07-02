class Transaction < ApplicationRecord
  belongs_to :from_wallet, class_name: "Wallet", foreign_key: :from_wallet_id
  belongs_to :to_wallet, class_name: "Wallet", foreign_key: :to_wallet_id

  def in_transactions(t)
    self.from_wallet_id == t
  end

  def out_transations(t)
    self.to_wallet_id == t
  end

end
