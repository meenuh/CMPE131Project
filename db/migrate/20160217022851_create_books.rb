class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :edition
      t.string :class_for
      t.string :professor
      t.string :isbn
      t.string :image
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
