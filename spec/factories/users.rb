FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { "赤西" }
    first_name { "未来" }
    last_name_kana { "アカニシ" }
    first_name_kana { "ミライ" }
    birth_date { "1990-01-01" }
  end
end
