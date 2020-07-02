class AccountsController < ApplicationController
  def show
    @account = Account.find(params[:id])
    @current_transacions = @account.wallet.transactions
  end
end
