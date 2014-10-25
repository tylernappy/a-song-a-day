class CreateMusicPeople < ActiveRecord::Migration
  def change
    create_table :music_people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :song_currently_jamming_to
      t.string :favorite_band_first
      t.string :favorite_band_second
      t.string :favorite_genre
      t.string :city
      t.string :state
      t.string :fun_activity
      t.string :listen_to_music_most_when

      t.timestamps
    end
  end
end
