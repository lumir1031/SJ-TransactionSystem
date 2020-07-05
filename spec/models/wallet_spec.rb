require 'rails_helper'

RSpec.describe Wallet, type: :model do

  let(:wallet){ create(:wallet) }

  it "an empty wallet's balance should be 0" do
    expect(wallet.balance).to be 0
  end

  context "deposit" do
    it "can deposit money to the wallet" do
      wallet.deposit(200)

      expect(wallet.balance).to be 200
    end
    it "can't deposit money with negative value" do
      expect { wallet.deposit(-10) }.to raise_error.with_message(/can't deposit money with negative value/)
      expect(wallet.balance).to be 0
    end
  end

  context "withdraw" do
    it "can withdraw money from the wallet" do
      wallet = create(:wallet, balance: 500)
      wallet.withdraw(200)

      expect(wallet.balance).to be 300
    end

    it "can't withdraw money if it is over the balance" do
      expect { wallet.withdraw(1000) }.to raise_error.with_message(/can't withdraw money if it is over the balance/)
      expect(wallet.balance).to be 0
    end

    it "can't withdraw money if it is less than zero" do
      expect { wallet.withdraw(-200) }.to raise_error.with_message(/can't withdraw money with negative value/)
      expect(wallet.balance).to be 0
    end
  end
end
