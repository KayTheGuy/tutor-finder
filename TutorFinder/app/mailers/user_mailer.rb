class UserMailer < ApplicationMailer

    def appointment_request(user)
        @user = user
        mail to: user.email, subject: "New Appointment Request" 
    end

    def signup_confirmation(user)
        @user = user
        #test email
        mail to: "tutorfindermarker@gmail.com", subject: "Sign Up Confirmation"
        #actual user's email for production
#        mail to: user.email, subject: "Sign Up Confirmation"
    end
end
