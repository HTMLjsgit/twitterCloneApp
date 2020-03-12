class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update]
	before_action :post_find ,only: [:show, :edit, :update]
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(create_params)
    @post.user_id = current_user.id
    @post.user_name = current_user.name
    @post.user_image = current_user.image
  	@post.save
  	redirect_to posts_path
  end

  def show
  end

  def edit
  end

  def update
    @post.update(create_params)
    redirect_to root_path
  end

  private

  def create_params
  	params.require(:post).permit(:body, :video, :image)
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
