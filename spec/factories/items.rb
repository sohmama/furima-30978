FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    introduction {Faker::Lorem.sentence}
    category_id {2} #{Category.all.sample}
    condition_id {2} #{Condition.all.sample}
    delivery_cost_id {2} #{DeliveryCost.all.sample}
    prefecture_id {2} #{Prefecture.all.sample}
    delivery_days_id {2} #{DeliveryDays.all.sample}
    price {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end

