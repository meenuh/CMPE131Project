class DeletePriceFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :price, :float
  end
end
