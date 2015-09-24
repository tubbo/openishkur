FactoryGirl.define do
  factory :genre do
    name Faker::Lorem.word.titleize
    description Faker::Lorem.paragraph
  end

  factory :sample do
    genre
    artist Faker::Lorem.words(2).titleize
    track Faker::Lorem.words(3).titleize
  end
end
