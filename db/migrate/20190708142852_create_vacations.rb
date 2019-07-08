class CreateVacations < ActiveRecord::Migration[5.2]
  def change
    create_table :vacations do |t|
      t.date :start_date
      t.date :end_date
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
