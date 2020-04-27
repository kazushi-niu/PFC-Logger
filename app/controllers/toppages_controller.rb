class ToppagesController < ApplicationController
  def index
    @menus = Menu.all
  end
end
