class UserMailer < ApplicationMailer
    def password_reset(user, token) 
    @resource = user 
    @token = token 
    mail(:to => user.email, 
         :subject => 'Password Reset Notification') 
    end
end
