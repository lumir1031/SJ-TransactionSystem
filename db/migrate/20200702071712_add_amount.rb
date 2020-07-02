class AddAmount < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :amount, :integer, null: false
  end
end
