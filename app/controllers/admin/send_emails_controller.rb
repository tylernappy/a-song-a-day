class Admin::SendEmailsController < ApplicationController
  def index
   #   debugger
   #   debugger
     @search_results = Search.new(MusicPerson, params[:music_person]).run #run search if any
   #   debugger
   #   debugger
   #   @music_people = @search_results.select {|music_person| (music_person.updated_at - DateTime.current).abs > 24.hours} #only show people who haven't been sent an email
     @music_people = @search_results.select {|music_person| (music_person.updated_at - DateTime.current).abs > 15.seconds} #only show people who haven't been sent an email
     @send_email = SendEmail.new
      @search = MusicPerson.new

   #   debugger
   #   debugger
  end

  def send_it
   #   debugger
   #   debugger
     ids = params[:send_email][:to].split("")
     ids.delete_at(0)
     ids.delete_at(ids.length-1)
     ids.delete_if {|number| number == "," || number == " " }
     ids.map! { |id| id.to_i }
   #   debugger
   #   debugger
     SendEmail.send_it(ids, params[:send_email][:song], params[:send_email][:artist], params[:send_email][:link], params[:send_email][:note])
   #   ids.each { |id| MusicPerson.find_by_id(id).update_attributes(last_song_sent: "#{params[:send_email][:song]} by #{params[:send_email][:artist]}") }
     redirect_to admin_send_emails_index_path, notice: 'Email sent'
  end
end
