# == Schema Information
#
# Table name: country_regions
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :country_region do
    name { Faker::Address.state }
  end
end
