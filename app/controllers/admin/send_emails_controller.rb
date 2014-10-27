class Admin::SendEmailsController < ApplicationController
  def index
     @music_people = MusicPerson.all
     @send_email = SendEmail.new
  end

  def send_it
     music_person = MusicPerson.find_by_id(params[:send_email][:to].to_i)
     debugger
     debugger
     SendEmail.send_it(music_person.email_address, params[:send_email][:song], params[:send_email][:artist], params[:send_email][:link], params[:send_email][:note])
     music_person.update_attributes(last_song_sent: "#{params[:send_email][:song]} by #{params[:send_email][:artist]}")
     redirect_to admin_send_emails_index_path, notice: 'Email sent'
  end
end
