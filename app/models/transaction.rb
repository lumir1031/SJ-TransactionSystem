class Transaction < ApplicationRecord
  attr_accessor :type
  belongs_to :from_wallet, class_name: "Wallet", foreign_key: :from_wallet_id
  belongs_to :to_wallet, class_name: "Wallet", foreign_key: :to_wallet_id


  def out_transations(t)
    self.from_wallet_id == t
  end

  def in_transactions(t)
    self.to_wallet_id == t
  end

  def set_type(wallet_id)
    puts "in set type"
    @type = wallet_id == self.to_wallet_id ? "label-incoming" : "label-outgoing"
    self
  end

end
