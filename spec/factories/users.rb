FactoryBot.define do
  factory :user do
    name { 'furima' }
    family_name { 'ふりま' }
    first_name { 'たろう' }
    family_name_k { 'フリマ' }
    first_name_k { 'タロウ' }
    email {Faker::Internet.email}
    password { 'test1234' }
    password_confirmation { password }
    birthday { '2000-01-01' }
  end
end