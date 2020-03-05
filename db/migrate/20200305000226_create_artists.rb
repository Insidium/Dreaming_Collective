class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :advocate, null: false, foreign_key: true
      t.string :nation
      t.text :bio
      t.string :artist_image

      t.timestamps
    end
  end
end
