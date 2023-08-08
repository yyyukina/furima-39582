FactoryBot.define do
  factory :item do
    name             { Faker::Commerce.product_name }
    description      { Faker::Lorem.paragraph }
    category_id      { Faker::Number.between(from: 2, to: 10) }
    condition_id     { Faker::Number.between(from: 2, to: 6) }
    fee_id           { Faker::Number.between(from: 2, to: 5) } 
    region_id        { Faker::Number.between(from: 1, to: 47) }
    shipping_day_id  { Faker::Number.between(from: 2, to: 4) }
    price            { Faker::Number.between(from: 300, to: 9999999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/furima_test.png'), filename: 'furima_test.png')
    end
    
  end
end
