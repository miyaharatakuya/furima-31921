FactoryBot.define do
  factory :item do
    name {"test"}
    text {"test"}
    condition_id {2}
    price {300}
    category_id {2}
    postage_id {2}
    sipping_area_id {2}
    sipping_date_id {2}
    user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
