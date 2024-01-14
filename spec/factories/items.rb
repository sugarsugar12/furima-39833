FactoryBot.define do
  factory :item do
    title { '商品名' }
    explanation { '商品の説明です' }
    category_id { 2 }
    quality_id { 2 }
    delivery_charge_id { 2 }
    source_id {2}
    number_of_day_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end