class CreateInputs < ActiveRecord::Migration[5.2]
  def change    
    create_table :inputs do |t|
      t.integer :n
      t.integer :value
      t.integer :tx_index
      t.integer :type
      t.string :script
      t.string :script_sig
      t.integer :sequence
      
      t.references :address, null: false, foreign_key: true
      t.references :btc_transaction, null: false, foreign_key: true
      t.timestamps
    end
  end
end
