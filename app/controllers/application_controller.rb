class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_menus = user.menus.count
    @count_followings = user.following.count
    @count_followers = user.followers.count
  end
end
