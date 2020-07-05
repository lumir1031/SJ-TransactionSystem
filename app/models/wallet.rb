class Wallet < ApplicationRecord
  #has_many :out_trasactions, class_name: "transaction", foreign_key: "from_wallet_id"
  #has_many :pay_transactions, through:
  #has_many :in_trasactions, class_name: "transaction", foreign_key: "to_wallet_id"

  belongs_to :account

  def transactions
    Transaction.where("from_wallet_id = ? OR to_wallet_id = ?", self.id, self.id).order(:updated_at).map do |transaction|
      transaction.set_type(self.id)
    end
  end

  def deposit(amount)
    self.balance = balance + amount
  end

  def withdraw(amount)
    self.balance = balance - amount
  end

end
