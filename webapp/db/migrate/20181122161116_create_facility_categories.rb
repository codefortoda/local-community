class CreateFacilityCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :facility_categories do |t|
      t.string :name, null: false
      t.boolean :sys_flag, null: false, default: false

      t.timestamps
    end
  end
end
