class UserMailer < ApplicationMailer
  def welcome_email()
     mail(from: "me@mailjet.com", to: "you@mailjet.com",
          subject: "This is a nice welcome email")
   end
end
