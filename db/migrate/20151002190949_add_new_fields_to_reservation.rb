class AddNewFieldsToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :address, :string
    add_column :reservations, :number_in_party, :integer
  end
end
