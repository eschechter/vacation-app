class AddNameColumnToVacations < ActiveRecord::Migration[5.2]
  def change
    add_column :vacations, :name, :string
  end
end
