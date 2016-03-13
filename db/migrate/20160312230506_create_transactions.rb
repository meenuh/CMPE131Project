class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :buyer, index: true, foreign_key: true
      t.references :seller, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
      t.float :price
      t.timestamps null: false
    end
  end
end
