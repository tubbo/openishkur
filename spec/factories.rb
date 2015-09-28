FactoryGirl.define do
  factory :user do
    name { Faker::Internet.user_name }
    email { Faker::Internet.safe_email }
    password 'password123'
    password_confirmation 'password123'
  end

  factory :genre do
    sequence(:name) { |n| "#{Faker::Lorem.word.titleize} #{n}" }
    description { Faker::Lorem.paragraph }
  end

  factory :sample do
    genre
    artist { Faker::Lorem.words(2).join("\s") }
    track { Faker::Lorem.words(3).join("\s") }
    file_id { 'hello' }
    sequence(:number) { |n| n }
  end

  factory :revision, class: Genre::Revision do
    genre
    user
    name 'new genre name'
    description 'new genre description'
  end
end
