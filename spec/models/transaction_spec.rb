require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context "transaction is successful" do
    it "can make a transaction from wallet_a to wallet_b" do
      wallet_a = create(:wallet, balance: 1000)
      wallet_b = create(:wallet)

      Transaction.create(from_wallet: wallet_a, to_wallet: wallet_b, amount: 200)

      expect(wallet_b.balance).to be 200
      expect(wallet_a.balance).to be 800
    end
  end
end
