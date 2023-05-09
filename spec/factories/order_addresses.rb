FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    phone { Faker::PhoneNumber.cell_phone }
    card_number { '4242424242424242' }
    card_expire_date { '12/26' }
    card_security_code { '123' }

    
  end
end
