class Api::TransactionsController < ApplicationController
  def create
    from_wallet = Wallet.find(transaction_params[:from_wallet_id])

    if from_wallet.account.token == params[:account_token]
      transaction = Transaction.new(transaction_params)
      begin
        transaction.save
        render json: transaction.as_json(only: [:from_wallet_id, :to_wallet_id, :amount])
      rescue => exception
        render json: {result: exception.message}, status: 400
      end
    else
      render json: {result: 'Authentication Failed'}, status: 400
    end
  end

  private
  def transaction_params
    params.require(:transaction).permit(:from_wallet_id,
                                        :to_wallet_id,
                                        :amount)
  end
end
