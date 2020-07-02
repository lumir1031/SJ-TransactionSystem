class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.integer :balance
      t.belongs_to :account
      t.timestamps
    end
  end
end
