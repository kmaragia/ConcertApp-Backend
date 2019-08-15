class CreateConcerts < ActiveRecord::Migration[5.2]
  def change
    create_table :concerts do |t|
      t.string :artist_id
      t.string :name
      t.string :location
      t.string :img
      t.string :date
      t.string :time
      t.string :venue_address


      t.timestamps
    end
  end
end
