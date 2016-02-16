class CreateSchool < ActiveRecord::Migration
	def change
		create_table :school do |t|
			t.string :name
			has_many :students
			t.integer :no_of_student
			t.timestamps null: false
		end
						
		creat_table :students do |t|
			t.string :email
			t.string :password
			t.string :username
			t.string :school
			t.string :major
			has_many :books
			t.timestamps null: false
		end
		
		creat_table :books do |t|
			t.string :title
			t.string :author
			t.string :edition
			t.string :isbn
			t.string :class_for
			t.string :professor
			t.string :image
			t.timestamps null: false			
		end
	end
end