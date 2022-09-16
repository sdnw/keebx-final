class Item < ApplicationRecord
    has_many :user_item_relationships
    has_many :users, through: :user_item_relationships

    def purchase(quantity_purchased, user)
        uir = UserItemRelationship.create(
            user_id: user.id, 
            item_id: self.id, 
            quantity_purchased: quantity_purchased,
            transaction_amount: self.price * quantity_purchased    
        )

        self.quantity -= quantity_purchased

        self
    end
end
