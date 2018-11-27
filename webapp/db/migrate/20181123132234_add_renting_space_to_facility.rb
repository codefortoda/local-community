class AddRentingSpaceToFacility < ActiveRecord::Migration[5.2]
  def change
    add_column :facilities, :renting_space, :boolean, null: false, default: false
    add_column :facilities, :conference, :boolean, null: false, default: false
    add_column :facilities, :performance, :boolean, null: false, default: false
    add_column :facilities, :sports, :boolean, null: false, default: false
    add_column :facilities, :classroom, :boolean, null: false, default: false
    add_column :facilities, :flyer, :boolean, null: false, default: false
  end
end
