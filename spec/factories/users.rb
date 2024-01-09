FactoryBot.define do
  factory :user do
    name { 'furima' }
    family_name { 'ふりま' }
    first_name { 'たろう' }
    family_name_k { 'フリマ' }
    first_name_k { 'タロウ' }
    email { 'test@example' }
    password { 'test1234' }
    password_confirmation { password }
    birthday { 123411 }
  end
end