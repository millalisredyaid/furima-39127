FactoryBot.define do
  factory :order_address do
    postal_code { '123-1234' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city  }
    street { Faker::Address.street_address }
    building { Faker::Address.street_address }
    phone { Faker::Number.decimal_part(digits: 11) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }

    
  end
end
