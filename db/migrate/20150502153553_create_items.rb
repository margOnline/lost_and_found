class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description
      t.integer :user_id
      t.integer :state

      t.timestamps null: false
    end
  end
end
