class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :delivery_days 

  belongs_to       :user
  # has_many         :comments
  has_one          :item_purchase
  has_one_attached :image
  
  with_options presence: true do
    validates :image         
    validates :name             
    validates :introduction     
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    with_options numericality: { other_than: 1 } do
      validates :category_id 
      validates :condition_id
      validates :delivery_cost_id
      validates :prefecture_id
      validates :delivery_days_id
    end
  end
end
