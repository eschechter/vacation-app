class ChangeHotelStayBackToDateTime < ActiveRecord::Migration[5.2]
  def change
    change_column :hotel_stays, :check_in_time, :datetime
    change_column :hotel_stays, :check_out_time, :datetime
  end
end
