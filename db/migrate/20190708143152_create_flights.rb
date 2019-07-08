class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :airline
      t.datetime :start_time
      t.datetime :end_time
      t.belongs_to :origin
      t.belongs_to :destination

      t.timestamps
    end
  end
end
