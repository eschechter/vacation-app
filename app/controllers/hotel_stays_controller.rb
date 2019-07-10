class HotelStaysController < ApplicationController
  def create
    @hotel_stay = HotelStay.create(hotel_stay_params)
    redirect_to vacation_path(@hotel_stay.vacation)
  end

  def destroy
    hotel_stay = HotelStay.find(params[:id])
    vacation = hotel_stay.vacation
    hotel_stay.destroy
    redirect_to vacation_path(vacation)
  end

  private

  def hotel_stay_params
    params.require(:hotel_stay).permit(:hotel_id, :vacation_id, :check_in_time, :check_out_time)
  end
end
