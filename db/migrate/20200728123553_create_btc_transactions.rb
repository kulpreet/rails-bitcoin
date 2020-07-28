class CreateBtcTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :btc_transactions do |t|

      t.boolean :double_spend, default: false
      t.integer :block_height, null: false
      t.integer :time, null: false
      t.string :relayed_by
      t.string :tx_hash, null: false
      t.integer :tx_index, null: false
      t.integer :version, null: false
      t.integer :size, null: false

      t.timestamps
    end
  end
end
