class UserController < ApplicationController
  def show
    user = User.find(params[:id])
    @blogs = user.blogs.page(params[:page]).per(5).order("created_at DESC")
  end
end

private
def user_params
 params.permit(:id)
end
