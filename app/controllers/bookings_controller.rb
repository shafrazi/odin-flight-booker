# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight])
    @booking = Booking.new
    passengers_num = params[:passengers_num].to_i
    passengers_num.times do
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      passengers = @booking.passengers
      flash[:success] = 'Booking created successfully!'
      passengers.each do |passenger|
        passenger.send_thank_you_mail(@booking)
      end
      redirect_to @booking
    else
      flash[:danger] = 'Invalid booking details. Please retry!'
      redirect_to root_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email id booking_id])
  end
end
