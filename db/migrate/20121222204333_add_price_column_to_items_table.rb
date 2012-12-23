class AddPriceColumnToItemsTable < ActiveRecord::Migration
  def change
    remove_column :items, :currency
    add_column :items, :price, :decimal
  end
end
