class CreateHotelStays < ActiveRecord::Migration[5.2]
  def change
    create_table :hotel_stays do |t|
      t.datetime :check_in_time
      t.datetime :check_out_time
      t.belongs_to :hotel, foreign_key: true
      t.belongs_to :vacation, foreign_key: true

      t.timestamps
    end
  end
end
