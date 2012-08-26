class AddGroupPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :group_password, :string
    add_column :users, :confirm_access, :string
  end
end
