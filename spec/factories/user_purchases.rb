FactoryBot.define do
  factory :user_purchase do
    postal_code {'123-4567'}
    prefecture_id {2}
    municipality {'東京都中央区'}
    address {'銀座1-1-1'}
    tel {'09012345678'}
  end
end
