# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/passenger_mailer/thank_you_mail
  def thank_you_mail
    PassengerMailer.thank_you_mail
  end

end
