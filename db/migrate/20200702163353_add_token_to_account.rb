class AddTokenToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :token, :string
    add_index :accounts, :token, unique: true
  end
end
