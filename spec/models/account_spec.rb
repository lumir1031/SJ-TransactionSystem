require 'rails_helper'

RSpec.describe Account, type: :model do
  context "create account" do
    let(:account){ create(:account) }

    it "generate a token while creating an account" do
      expect(account.token).not_to be_empty
    end
    it "create an empty wallet for a new account" do
      expect(account.wallet.balance).to be 0
    end
  end
end
