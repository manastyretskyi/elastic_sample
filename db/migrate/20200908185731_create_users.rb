class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.references :city, null: false, foreign_key: true
      t.text :about
      t.date :dob
      t.text :notes

      t.timestamps
    end
  end
end
