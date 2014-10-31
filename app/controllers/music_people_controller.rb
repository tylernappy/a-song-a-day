class MusicPeopleController < ApplicationController
  def index
  end

  def create
     @music_person = MusicPerson.create(music_person_permit)
     redirect_to root_path, notice: 'Thanks for signing up!'
  end

  def new
     @music_person = MusicPerson.new
  end

  private
  def music_person_permit
    params.require(:music_person).permit(:first_name, :last_name, :email_address, :song_currently_jamming_to, :favorite_band_first, :favorite_band_second, :favorite_genre, :city, :state, :fun_activity, :listen_to_music_most_when, :last_song_sent)
  end
end
