require 'rails_helper'

RSpec.describe "Api::Transactions", type: :request do
  describe "post/ api_transaction" do

    let(:wallet_a) { create(:wallet, balance: 1000) }
    let(:wallet_b) { create(:wallet) }

    it "be able to create a payment transaction" do
      post api_transactions_path,
           params:{
             transaction: {
               from_wallet_id: wallet_a.id,
               to_wallet_id: wallet_b.id,
               amount: 200
             },
             account_token: wallet_a.account.token
           }

      expect(response).to have_http_status(200)
    end

    it "can not create a payment transaction without token" do
      post api_transactions_path,
           params:{
             transaction: {
               from_wallet_id: wallet_a.id,
               to_wallet_id: wallet_b.id,
               amount: 200
             },
             account_token: 'tryyyyyyy'
           }

      expect(response).to have_http_status(400)
      return_data = JSON.parse(response.body)
      expect(return_data["result"]).to eq("Authentication Failed")
    end

    it "can not create a payment transaction if amount is not enough" do
      post api_transactions_path,
           params:{
             transaction: {
               from_wallet_id: wallet_a.id,
               to_wallet_id: wallet_b.id,
               amount: 2000
             },
             account_token: wallet_a.account.token
           }

      expect(response).to have_http_status(400)
      return_data = JSON.parse(response.body)
      expect(return_data["result"]).to eq("can't withdraw money if it is over the balance")
    end

    it "can not create a payment transaction with negative value" do
      post api_transactions_path,
           params:{
             transaction: {
               from_wallet_id: wallet_a.id,
               to_wallet_id: wallet_b.id,
               amount: -1000
             },
             account_token: wallet_a.account.token
           }

      expect(response).to have_http_status(400)
      return_data = JSON.parse(response.body)
      expect(return_data["result"]).to eq("can't withdraw money with negative value")
    end

  end
end
