class FavouritesController < ApplicationController

  def index
    @favourites = Favourite.where(user_id: params[:user_id]).
                   paginate page: params[:page], per_page: 3
  end

  def create
    activity_favourite = Activity.create! user_id: current_user.id
    Favourite.create! user_id: current_user.id, 
                 book_id: params[:book_id],
                 activity_id: activity_favourite.id
  end
end