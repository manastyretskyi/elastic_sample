# == Schema Information
#
# Table name: country_regions
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CountryRegion < ApplicationRecord
  has_many :cities
end
