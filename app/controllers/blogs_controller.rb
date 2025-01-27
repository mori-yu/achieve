class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @blogs = Blog.all
    @Users = User.all
  end
  
  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blogs_params)
    @user = User.find(current_user.id)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
      NoticeMailer.sendmail_blog(@blog,@user).deliver
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    @blog.update(blogs_params)
    redirect_to blogs_path, notice: "ブログを編集しました！"
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました..."
  end
  
  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?
  end
  
  def show
    @comment = @blog.comments.build
    @comments = @blog.comments
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end
  
  private
    def blogs_params
      params.require(:blog).permit(:title, :content)
    end
    
    def set_blog
      @blog = Blog.find(params[:id])
    end
end
