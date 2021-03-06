class SalonsController < ApplicationController

  def index
    @salons = Salon.all
  end

  def show
    @salon = Salon.find(params[:id])
    @stylists = Stylist.where(:salon_id => @salon.id)
  end

  def new
    @salon = Salon.new
  end

  def create
    if current_stylist
      @salon = Salon.new(salon_params)
      @salon.lookup_by_phone
      @salon.save
      redirect_to salons_path
    else
      redirect_to root_path
    end
  end


  private
  def salon_params
    params.require(:salon).permit(:phone_number)
  end


end



