class DishesController < ApplicationController
	
	before_action :require_user, only: [:index]
  def index
  	@dishes = Dish.all
  end
end
