class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    puts "Creating post with params: ================================================"
    puts post_params.inspect
    puts "==========================================================================="
    puts "Creating post with params: #{post_params.inspect}"
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully deleted.'
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  private
    def post_params
      params.expect(post: [:title, :body]) 
    end
end
