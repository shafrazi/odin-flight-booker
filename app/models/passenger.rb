# frozen_string_literal: true

class Passenger < ApplicationRecord
  belongs_to :booking
  validates :name, presence: true
  validates :email, presence: true

  def send_thank_you_mail(booking)
    PassengerMailer.thank_you_mail(self, booking).deliver_now
  end
end
