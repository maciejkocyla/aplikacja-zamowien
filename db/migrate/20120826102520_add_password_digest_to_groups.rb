class AddPasswordDigestToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :password_digest, :string
  end
end
