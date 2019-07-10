class ChangeCityCountryToState < ActiveRecord::Migration[5.2]
  def change
    rename_column :cities, :country, :state
  end
end
