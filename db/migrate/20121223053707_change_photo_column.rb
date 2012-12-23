class ChangePhotoColumn < ActiveRecord::Migration
  def change
    remove_column :items, :image_url
    add_column :items, :photo, :string
  end
end
