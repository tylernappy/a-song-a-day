class SendEmail < ActiveRecord::Base
   def self.send_it(to, song, artist, link, note)
      HTTParty.post(
         "https://api.mailjet.com/v3/send/message",
         :body => {
            :to => to,
            :from => ENV['myRegisteredMailjetEmailAtDomainDotCom'],
            :subject => "Your song today!",
            :html => "#{song}, #{artist}, #{link}, #{note}"
            # :subject => EmailTemplate.first.subject,
            # :html => EmailTemplate.first.body
         },
         :basic_auth => {:username => ENV['yourApiKey'], :password => ENV['yourSecretKey'] }
      )
   end
end
