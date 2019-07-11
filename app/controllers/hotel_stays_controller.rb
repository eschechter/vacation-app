class HotelStaysController < ApplicationController
  def create
    @hotel_stay = HotelStay.new(hotel_stay_params)
    if @hotel_stay.valid?
      @hotel_stay.save
    else
      flash[:errors] = @hotel_stay.errors.full_messages
    end
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
