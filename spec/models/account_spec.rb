require 'rails_helper'

RSpec.describe Account, type: :model do
  context "create account" do
    it "generate a token while creating an account" do
      account = create(:account)
      expect(account.token).not_to be_empty
    end
  end
end
