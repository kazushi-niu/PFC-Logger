class CommentsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @menu = Menu.find(params[:menu_id])
    @comment = @menu.comments.build(comment_paramas)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  
  def comment_paramas
    params.require(:comment).permit(:content)
  end
end
