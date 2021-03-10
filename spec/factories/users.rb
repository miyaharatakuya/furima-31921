FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'aaa000' }
    password_confirmation { password }
    first_name            { '一郎' }
    last_name             { '鈴木' }
    first_name_furigana   { 'イチロウ' }
    last_name_furigana    { 'スズキ' }
    birthday              { '2020-01-01' }
  end
end
