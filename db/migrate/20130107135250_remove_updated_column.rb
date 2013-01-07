class RemoveUpdatedColumn < ActiveRecord::Migration
  def change
    remove_column :items, :corrected_status #Cleaning this up since we aren't using it.
  end
end
