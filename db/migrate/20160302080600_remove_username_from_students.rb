class RemoveUsernameFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :username, :string
  end
end
