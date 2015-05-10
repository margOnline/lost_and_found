class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :source_file_file_name
      t.string :source_file_content_type
      t.integer :source_file_file_size
      t.datetime :source_file_updated_at
      t.integer :item_id, :integer
      
      t.timestamps
    end
  end
end
