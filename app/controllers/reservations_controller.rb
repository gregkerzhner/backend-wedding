class ReservationsController < ApplicationController

  def show
    render json: Reservation.all
  end

  def create
    @reservation = Reservation.where(email: params[:email]).first_or_create
    @reservation.update(registration_params)
    if @reservation.valid?
      render json: @reservation, status: :created
    else
      render json: @reservation.errors.full_messages, status: :bad_request
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation && @reservation.destroy
      render json: @reservation, status: :no_content
    else
      render json: {}, status: :not_found
    end
  end


  def registration_params
    params.permit(:name, :lat_lon, :email, :attending_ceremony, :attending_potluck, :attending_party, :address, :number_in_party)
  end
end
