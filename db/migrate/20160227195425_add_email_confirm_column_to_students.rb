class AddEmailConfirmColumnToStudents < ActiveRecord::Migration
  def change
    add_column :students, :email_confirmed, :boolean
    add_column :students, :confirm_token, :string
  end
end
