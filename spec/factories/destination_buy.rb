FactoryBot.define do
      factory :destination_buy do
        post_code { '123-4567' }
        prefecture_id { 2 }
        city { '東京都' }
        street_address { '1-1' }
        building_name { '東京ハイツ' }
        telephone_number { '09012345678' }
        token {"tok_abcdefghijk00000000000000000"}

      end
    end
