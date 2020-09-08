# == Schema Information
#
# Table name: books
#
#  id           :bigint           not null, primary key
#  genre        :string
#  published_at :datetime
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    genre { Faker::Book.genre }
    published_at { Faker::Date.between(from: '1654-01-01', to: Time.zone.now)}
  end
end
