class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address, null: false, limit: 35
      t.timestamp :last_fetched_at

      t.timestamps
    end
  end
end
