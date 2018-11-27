class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.integer :identifier
      t.integer :organization_code
      t.string :organization_name
      t.string :identifier_name
      t.string :name
      t.text :overview
      t.string :common_name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :tel
      t.string :url
      t.float :barrier_free
      t.references :facility_category, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
