class ReservationsController < ApplicationController

  def index
    render json: {data: Reservation.all}
  end

  def create
    @reservation = Reservation.where(registration_params).first_or_create
    if @reservation.valid?
      render json: @reservation, status: :created
    else
      render json: @reservation.errors.full_messages, status: :bad_request
    end
  end


  def registration_params
    params.permit(:name, :lat_lon, :email, :attending_ceremony, :attending_potluck, :attending_party)
  end
end
