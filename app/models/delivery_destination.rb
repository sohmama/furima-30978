class DeliveryDestination < ApplicationRecord
  has_one :item_purchase
end
