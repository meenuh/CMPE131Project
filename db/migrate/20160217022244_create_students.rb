class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :email
      t.string :password
      t.string :username
      t.string :university
      t.string :major
      t.references :school, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
