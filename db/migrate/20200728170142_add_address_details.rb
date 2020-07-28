class AddAddressDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :hash160, :string
    add_column :addresses, :n_tx, :integer
    add_column :addresses, :total_received, :bigint
    add_column :addresses, :total_sent, :bigint
    add_column :addresses, :final_balance, :bigint

    add_index :addresses, :hash160
  end
end
