FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {Gimei.name.last.kanji}
    first_name            {Gimei.name.first.kanji}
    family_kana           {Gimei.name.last.katakana}
    first_kana            {Gimei.name.first.katakana}
    birthday              {Faker::Date.backward}
  end
end