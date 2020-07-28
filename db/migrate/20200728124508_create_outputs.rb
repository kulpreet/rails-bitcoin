class CreateOutputs < ActiveRecord::Migration[5.2]
  def change
    create_table :outputs do |t|
      t.integer :n
      t.integer :value
      t.integer :tx_index
      t.string :script
      t.boolean :spent

      t.references :address, null: false, foreign_key: true
      t.references :btc_transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
