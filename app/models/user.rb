# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  about      :text
#  dob        :date
#  full_name  :string
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :bigint           not null
#
# Indexes
#
#  index_users_on_city_id  (city_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#
class User < ApplicationRecord
  include Searchable
  
  settings SEARCH_SETTINGS do
    mappings dynamic: false do
      indexes :id, type: :integer
      indexes :full_name, type: :text
    end
  end

  belongs_to :city
end
