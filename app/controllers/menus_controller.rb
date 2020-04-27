class MenusController < ApplicationController
  before_action :require_user_logged_in, only: ["new","create","edit","update","destroy"]
  before_action :corrent_user, only: [:edit, :update, :destroy]
  
  def show
    @menu = Menu.find(params[:id])
  end
  
  def new
    @menu = Menu.new
  end
  
  def create
    @menu = current_user.menus.build(menu_params)
    if @menu.save
      flash[:success] = 'メニューを投稿しました。'
      redirect_to user_url(id: current_user)
    else
      @menus = current_user.menus.order(id: :desc).page(params[:page])
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end
  
  def edit
    @menu = Menu.find(params[:id])
  end
  
  def update
    @menu = Menu.find(params[:id])
    
    if @menu.update(menu_params)
      flash[:success] = 'Menuは正常に更新されました'
      redirect_to user_url(id: current_user)
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :edit
    end
  end
  
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    
    flash[:sccess] = 'Menuを削除しました'
    redirect_to user_url(id: current_user)
  end
  
  private
  
  def menu_params
    params.require(:menu).permit(:name, :protein, :fat, :carbohydrates, :title, :text, :img, :remove_img)
  end
  
  def corrent_user
    @menu = current_user.menus.find_by(id: params[:id])
    unless @menu
      redirect_to root_url
    end
  end

end
