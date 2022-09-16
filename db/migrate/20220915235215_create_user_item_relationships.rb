class CreateUserItemRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :user_item_relationships do |t|
      t.integer :item_id
      t.integer :user_id
      t.integer :quantity_purchased
      t.float :transaction_amount

      t.timestamps
    end
  end
end
