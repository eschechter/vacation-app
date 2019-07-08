class ChangeHotelStayTimesToDates < ActiveRecord::Migration[5.2]
  def change
    change_column :hotel_stays, :check_in_time, :date
    change_column :hotel_stays, :check_out_time, :date
  end
end
