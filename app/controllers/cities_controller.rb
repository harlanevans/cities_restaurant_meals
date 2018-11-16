class CitiesController < ApplicationController
  before_action :set_city, except: [:index, :new, :create]
  
  def index
    @cities = City.all
  end

  def show
    #before_action
  end

  def edit
    #before_action
    render partial: "form"
  end

  def update
    if @city.update(city_params)
      redirect_to cities_path
    else
      render :edit
    end
  end

  def new
    @city = City.new
    render partial: "form"
  end
  
  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to cities_path
    else
      render :new
    end
  end

  def destroy
    @city.destroy
    redirect_to cities_path
  end

    private

    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name)
    end
end
