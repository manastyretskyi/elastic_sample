# == Schema Information
#
# Table name: cities
#
#  id                :bigint           not null, primary key
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  country_region_id :bigint           not null
#
# Indexes
#
#  index_cities_on_country_region_id  (country_region_id)
#
# Foreign Keys
#
#  fk_rails_...  (country_region_id => country_regions.id)
#
FactoryBot.define do
  factory :city do
    name { Faker::Address.city }
    region { CountryRegion.all.sample }
  end
end
