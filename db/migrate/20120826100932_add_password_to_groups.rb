class AddPasswordToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :password, :string
    add_column :groups, :password_confirmation, :string
  end
end
