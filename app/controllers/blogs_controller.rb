class BlogsController < ApplicationController

  def index
    @blogs = Blog.order("created_at DESC").page(params[:page]).per(10)
  end

  def new
  end

  def create
    Blog.create(text: blog_params[:text], user_id: current_user.id)
  end

  def destroy
    @blog = Blog.find_by(id: params[:id])
    @blog.destroy
    redirect_to action: :index 
  end

  def edit
    @blog = Blog.find(blog_params[:id])
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params) if blog.user_id == current_user.id
  end

  private
  def blog_params
   params.permit(:id, :text)
  end
  
  def move_to_index
   redirect_to action: :index 
  end 

end