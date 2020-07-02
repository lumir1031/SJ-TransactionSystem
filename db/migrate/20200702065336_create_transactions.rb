class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :from_wallet_id
      t.integer :to_wallet_id
      t.timestamps
    end
  end
end
