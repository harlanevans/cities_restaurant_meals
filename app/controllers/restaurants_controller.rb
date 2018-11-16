class RestaurantsController < ApplicationController
  
  before_action :set_city
  before_action :set_restaurant, except: [:index, :new, :create]
  
  def index
    @restaurants = @city.restaurants
  end

  def show
    #before_action
  end

  def edit
    #before_action
    render partial: "form"
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to city_restaurant_path
    else
      render :edit
    end
  end

  def new
    @restaurant = @city.restaurants.new
    render partial: "form"
  end
  
  def create
    @restaurant = @city.restaurants.new(restaurant_params)
    if @restaurant.save
      redirect_to city_restaurants_path
    else
      render :new
    end
  end

    private


    def set_city
      @city = City.find(params[:city_id])
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :type_of_food)
    end
end
