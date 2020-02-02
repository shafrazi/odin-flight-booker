# frozen_string_literal: true

class PassengerMailer < ApplicationMailer
  include ApplicationHelper
  helper ApplicationHelper
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.passenger_mailer.thank_you_mail.subject
  #
  def thank_you_mail(passenger, _booking)
    @passenger = passenger
    @booking = _booking
    mail to: @passenger.email
  end
end
