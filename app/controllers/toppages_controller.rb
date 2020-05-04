class ToppagesController < ApplicationController
  def index
    @menus = Menu.search(params[:search]).page(params[:page])
  end
end
