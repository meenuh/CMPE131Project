class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :no_of_students

      t.timestamps null: false
    end
  end
end
