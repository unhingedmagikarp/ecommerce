class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :name
      t.text :description
      t.text :image
      t.integer :price
      t.string :size
      t.integer :stock
      t.integer :times_purchased

      t.timestamps
    end
  end
end
