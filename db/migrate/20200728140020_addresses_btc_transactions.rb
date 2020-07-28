class AddressesBtcTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses_btc_transactions, id: false do |t|
      t.belongs_to :address
      t.belongs_to :btc_transaction
    end
  end
end
