class AddStateToItem < ActiveRecord::Migration
  def change
    change_column :items, :state, :integer, null: false, default: 0
    add_index :items, :state
  end
end
