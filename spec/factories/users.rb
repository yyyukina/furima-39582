FactoryBot.define do
    factory :user do
      nickname { Faker::Name.initials(number: 2) }
      email { Faker::Internet.email }
      password { "g9" + Faker::Internet.password(min_length: 6) }
      password_confirmation { password }
      last_name { Gimei.first.kanji }
      first_name { Gimei.last.kanji  }
      last_name_kana { Gimei.last.katakana }
      first_name_kana { Gimei.first.katakana }
      birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
    end
end
  
  
  