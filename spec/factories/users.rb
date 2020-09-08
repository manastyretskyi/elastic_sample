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
FactoryBot.define do
  factory :user do
    full_name { Faker::Name.name }
    city { City.all.sample }
    # about { Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4) }
    # dob { Faker::Date.between(from: '1870-01-01', to: '1933-09-25') }
    # notes { Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4) }
  end
end
