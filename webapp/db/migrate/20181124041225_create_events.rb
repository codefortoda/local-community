class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :group, foreign_key: true
      t.string :name
      t.string :url
      t.string :place
      t.string :kaisai_date
      t.text :notices
      t.text :announcement
      t.string :price
      t.string :organizer
      t.text :how_apply
      t.string :period
      t.string :contact_name
      t.string :ontact
      t.string :location
      t.string :access
      t.string :parking_lot

      t.timestamps
    end
  end
end
