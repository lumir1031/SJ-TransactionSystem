class Wallet < ApplicationRecord
  #has_many :out_trasactions, class_name: "transaction", foreign_key: "from_wallet_id"
  #has_many :pay_transactions, through:
  #has_many :in_trasactions, class_name: "transaction", foreign_key: "to_wallet_id"

  def transactions
    Transaction.where("from_wallet_id = ? OR to_wallet_id = ?", self.id, self.id).order(:updated_at)
  end

end
