class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update]
	before_action :post_find ,only: [:show, :destroy]
  before_action :is_mine, only: [:destroy]
  def index
  	@posts = Post.all.order(created_at: :desc)
    @users = User.all
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(create_params)
    @post.user_id = current_user.id
  	@post.save
  	redirect_to posts_path
  end

  def show
    @like = Like.new
    @comment = Comment.new
    @users = User.all
    @comments = Comment.all
    @likePosts = @post.likes
    @commentPosts = @post.comment
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def search
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
    @users = User.all
  end
  private

  def create_params
  	params.require(:post).permit(:body, :video, :image, :tag_list)
  end

  def post_find
  	@post = Post.find params[:id]
  end

  def is_mine
    if @post.user_id != current_user.id
        redirect_to root_path(@post)
    end
  end
end
