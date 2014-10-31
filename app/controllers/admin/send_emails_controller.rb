class Admin::SendEmailsController < ApplicationController
  def index
   #   debugger
   #   debugger
     @music_people = Search.new(MusicPerson, params[:music_person]).run
   #   @music_people.order = 'updated_at'
     @send_email = SendEmail.new

   #   @search = Search.new(MusicPerson, params[:search])
      @search = MusicPerson.new

   #   debugger
   #   debugger
  end

  def send_it
     debugger
     debugger
     ids = params[:send_email][:to].split("")
     ids.delete_at(0)
     ids.delete_at(ids.length-1)
     ids.delete_if {|number| number == "," || number == " " }
     ids.map! { |id| id.to_i }
     debugger
     debugger
     SendEmail.send_it(ids, params[:send_email][:song], params[:send_email][:artist], params[:send_email][:link], params[:send_email][:note])
   #   ids.each { |id| MusicPerson.find_by_id(id).update_attributes(last_song_sent: "#{params[:send_email][:song]} by #{params[:send_email][:artist]}") }
     redirect_to admin_send_emails_index_path, notice: 'Email sent'
  end
end
