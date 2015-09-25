FactoryGirl.define do
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
