class CreateCountryRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :country_regions do |t|
      t.string :name

      t.timestamps
    end
  end
end
