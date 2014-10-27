class FindAlikeSong < ActiveRecord::Base
   def self.perform(music_person)
      results = {
         similar_artists: Echowrap.artist_similar(:name => music_person.favorite_band_first, :results => 3),

         }

   end
end
