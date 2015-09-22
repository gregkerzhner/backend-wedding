class RegistrationsController < ApplicationController

  def index
    render json: {data: Registration.all}
  end

  def create
    @registration = Registration.where(registration_params).first_or_create
    if @registration.valid?
      render json: @registration, status: :created
    else
      render json: @registration.errors.full_messages, status: :bad_request
    end
  end


  def registration_params
    params.permit(:name, :lat_lon, :email, :attending_ceremony, :attending_potluck, :attending_party)
  end
end
