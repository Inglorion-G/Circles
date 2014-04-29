class PostsController < ApplicationController

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)

    @post.links.new(link_params)
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author_id)
  end

  def link_params
    params.permit(:links => [:title, :url])
          .require(:links)
          .values
          .reject { |data| data.values.all?(&:blank?) }
  end
end