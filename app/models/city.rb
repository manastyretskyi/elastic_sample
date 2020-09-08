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
class City < ApplicationRecord
  include Searchable

  settings SEARCH_SETTINGS do
    mappings dynamic: false do
      indexes :id, type: :integer
      indexes :name, type: :text
    end
  end

  belongs_to :region, class_name: 'CountryRegion', foreign_key: 'country_region_id'
end
