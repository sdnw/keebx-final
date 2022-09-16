class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.string :image
      t.string :description
      t.integer :quantity

      t.timestamps
    end
  end
end
