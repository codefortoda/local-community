class AddColumnToFacility < ActiveRecord::Migration[5.2]
  def change
    add_column :facilities, :start_time, :string
    add_column :facilities, :end_time, :string
    add_column :facilities, :use, :text
    add_column :facilities, :service, :text
    add_column :facilities, :fixture, :text
  end
end
