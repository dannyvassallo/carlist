class VehiclesController < ApplicationController
  def index
    if params[:search]
      @vehicles = Vehicle.search(params[:search]).paginate(:page => params[:page], :per_page => 50)
    else
      @vehicles = Vehicle.all.paginate(:page => params[:page], :per_page => 50)
    end
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.build(vehicle_params)    

    if @vehicle.save
      flash[:notice] = "Vehicle was saved."
      redirect_to vehicle_path
    else
      flash[:error] = "There was an error saving the vehicle. Please try again."
      render :new
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])    

    if @vehicle.save
      flash[:notice] = "Vehicle was saved."
      redirect_to vehicle_path
    else
      flash[:error] = "There was an error saving the vehicle. Please try again."
      render :new
    end    
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])    

    if @vehicle.destroy
      flash[:notice] = "Vehicle  was deleted successfully."
      redirect_to @vehicle
    else
      flash[:error] = "There was an error deleting the vehicle. Please try again."
      render :show
    end
  end

  def show
    @vehicle.find(params[:id])
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:year, :make, :model)
  end
end
