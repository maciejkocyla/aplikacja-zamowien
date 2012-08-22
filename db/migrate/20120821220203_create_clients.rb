class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :id
      t.string :name
      t.string :surname
      t.string :address
      t.integer :order_id
      t.integer :group_id

      t.timestamps
    end
  end
end
