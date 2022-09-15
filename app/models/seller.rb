class Seller < ApplicationRecord
    has_many :items 
    has_many :users, through: :items
end
