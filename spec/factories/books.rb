FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    genre { Faker::Book.genre }
    published_at { Faker::Date.between(from: '1654-01-01', to: Time.zone.now)}
  end
end
