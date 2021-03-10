FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567'}
    sipping_area_id { 1 }
    city { 'テスト市'}
    house_number { 'テスト町' }
    building { 'テストビル123' }
    phone_number { '09012345678'}
    token { 'tok_abc0000000000000000000000000' }
  end
end