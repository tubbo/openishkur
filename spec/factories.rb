FactoryGirl.define do
  factory :user do
    name { Faker::Internet.user_name }
    email { |n| Faker::Internet.safe_email("name#{n}") }
    password 'password123'
    password_confirmation 'password123'
  end

  factory :genre do
    name { |n| "#{Faker::Lorem.word.titleize} #{n}" }
    description { Faker::Lorem.paragraph }
  end

  factory :sample do
    genre
    artist { Faker::Lorem.words(2).join("\s") }
    track { Faker::Lorem.words(3).join("\s") }
    file_id { 'hello' }
    number 1
  end
end
