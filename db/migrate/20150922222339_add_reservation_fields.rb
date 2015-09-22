class AddReservationFields < ActiveRecord::Migration
  def change
    add_column :reservations, :name, :string
    add_column :reservations, :email, :string
    add_column :reservations, :lat_lon, :string
    add_column :reservations, :attending_ceremony, :boolean
    add_column :reservations, :attending_potluck, :boolean
    add_column :reservations, :attending_party, :boolean
  end
end
