class FavoritesController < ApplicationController
  before_action :authenticate_user!
  # POST /books/:book_id/favorites
  # POST /favorites.json
  def create
    favorite = current_user.favorites.new(:book_id => params[:book_id])
    favorite.save
    redirect_to request.referer
  end


  # DELETE /books/:book_id/favorites/
  def destroy
    favorite = Favorite.find_by(user_id: current_user, book_id: params[:book_id])
    favorite.destroy
    redirect_to request.referer
  end
end
