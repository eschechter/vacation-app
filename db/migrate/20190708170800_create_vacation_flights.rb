class CreateVacationFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :vacation_flights do |t|
      t.belongs_to :vacation, foreign_key: true
      t.belongs_to :flight, foreign_key: true

      t.timestamps
    end
  end
end
