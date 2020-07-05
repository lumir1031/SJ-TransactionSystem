require 'rails_helper'

RSpec.describe Wallet, type: :model do

  let(:wallet){ create(:wallet) }

  it "an empty wallet's balance should be 0" do
    expect(wallet.balance).to be 0
  end

  context "balance transaction" do
    it "can add money in the wallet" do
      wallet.deposit(200)
      expect(wallet.balance).to be 200
    end
    it "can take money from the wallet" do
      wallet.deposit(500)
      wallet.withdraw(200)
      expect(wallet.balance).to be 300
    end
  end
end
