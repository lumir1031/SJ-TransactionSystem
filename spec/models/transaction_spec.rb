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

  context "transaction is failed" do
    it "can not make a transaction if wallet_a's money is over the balance" do
      wallet_a = create(:wallet, balance: 100)
      wallet_b = create(:wallet)

      expect { Transaction.create(from_wallet: wallet_a, to_wallet: wallet_b, amount: 200) }.to raise_error.with_message(/can't withdraw money if it is over the balance/)

      expect(wallet_a.balance).to be 100
      expect(wallet_b.balance).to be 0
    end
    it "can not make a transaction with negative value" do
      wallet_a = create(:wallet, balance: 100)
      wallet_b = create(:wallet)

      expect { Transaction.create(from_wallet: wallet_a, to_wallet: wallet_b, amount: -200) }.to raise_error.with_message(/can't withdraw money with negative value/)

      expect(wallet_a.balance).to be 100
      expect(wallet_b.balance).to be 0
    end
  end
end
