FactoryGirl.define do
  factory :user do
    user_password = Faker::Internet.password

    name Faker::Internet.user_name
    email Faker::Internet.safe_email
    password user_password
    password_confirmation user_password
  end

  factory :genre do
    name Faker::Lorem.word.titleize
    description Faker::Lorem.paragraph
  end

  factory :sample do
    genre
    artist Faker::Lorem.words(2).join("\s")
    track Faker::Lorem.words(3).join("\s")
  end
end
