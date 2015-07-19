class VehiclesController < ApplicationController
  def index
    if params[:search]
      @vehicles = Vehicle.search(params[:search]).paginate(:page => params[:page], :per_page => 50)
    else
      @vehicles = Vehicle.all.paginate(:page => params[:page], :per_page => 50)
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end
end
