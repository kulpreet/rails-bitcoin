class AddIndexOnAddress < ActiveRecord::Migration[5.2]
  def change
    add_index :addresses, :address
  end
end
