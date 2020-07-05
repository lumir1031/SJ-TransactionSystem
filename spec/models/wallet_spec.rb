require 'rails_helper'

RSpec.describe Wallet, type: :model do
  let(:wallet){ create(:wallet) }

  it "an empty wallet's balance should be 0" do
    expect(wallet.balance).to be 0
  end

  context "wallet " do
    it "can add money in the wallet" do
      wallet.deposit(200)
      expect(wallet.balance).to be 200
    end
  end
end
