class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.string :taste_level
      t.integer :stars
      t.belongs_to :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
