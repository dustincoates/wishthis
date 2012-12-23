class AddItemTable < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :image_url
      t.string :item_url
      t.decimal :currency
      t.integer :user_id
      t.text :note
      t.boolean :corrected_status #Did the user have to make a correction?
      t.timestamps
    end
  end
end
