class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :image, null: false
      t.string :facebook_url
      t.string :url
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
