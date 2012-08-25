class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :id
      t.integer :client_id
      t.integer :group_id
      t.string :name
      t.integer :quantity
      t.string :kind
      t.boolean :completed
      t.boolean :incoming

      t.timestamps
    end
  end
end
