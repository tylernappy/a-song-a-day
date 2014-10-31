class SendEmail < ActiveRecord::Base
   def self.send_it(ids, song, artist, link, note)
      ids.each do |id|
         music_person = MusicPerson.find_by_id(id)
         response = HTTParty.post(
            "https://api.mailjet.com/v3/send/message",
            :body => {
               :to => music_person.email_address,
               :from => ENV['myRegisteredMailjetEmailAtDomainDotCom'],
               :subject => "Your song today!",
               :html => "#{song}, #{artist}, #{link}, #{note}"
               # :subject => EmailTemplate.first.subject,
               # :html => EmailTemplate.first.body
            },
            :basic_auth => {:username => ENV['yourApiKey'], :password => ENV['yourSecretKey'] }
         )
         music_person.update_attributes(last_song_sent: "#{song} by #{artist}")
         puts response
      end
   end
end
