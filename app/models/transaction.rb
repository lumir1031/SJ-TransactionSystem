class Transaction < ApplicationRecord
  attr_accessor :type
  belongs_to :from_wallet, class_name: "Wallet", foreign_key: :from_wallet_id
  belongs_to :to_wallet, class_name: "Wallet", foreign_key: :to_wallet_id

  before_create :make_transaction

  def set_type(wallet_id)
    @type = wallet_id == self.to_wallet_id ? "label-incoming" : "label-outgoing"
    self
  end

  private

  def make_transaction
    ActiveRecord::Base.transaction do
      from_wallet.withdraw(amount)
      to_wallet.deposit(amount)
    end
  end

end
