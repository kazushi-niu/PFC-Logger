class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @menu = Menu.find(params[:menu_id])
    @menu.favorite(current_user)
    flash[:success] = "お気に入り登録をしました"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @menu = Menu.find(params[:menu_id])
    @menu.unfavorite(current_user)
    flash[:success] = "お気に入りを解除しました"
    redirect_back(fallback_location: root_path)
  end
end
