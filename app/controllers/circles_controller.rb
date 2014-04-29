class CirclesController < ApplicationController

  def index
    @circles = Circle.all
  end

  def show
    @circle = Circle.find(params[:id])
    render :show
  end

  def new
    @circle = Circle.new
    render :new
  end

  def create
    @circle = current_user.owned_circles.new(circle_params)
    if @circle.save!
      redirect_to @circle
    else
      flash.now[:errors] = @circle.errors.full_messages
      render :new
    end
  end

  def edit
    @circle = Circle.find(params[:id])
    render :edit
  end

  def update
    @circle = Circle.find(params[:id])
    if @circle.update_attributes(circle_params)
      redirect_to @circle
    else
      flash.now[:errors] = @circle.errors.full_messages
      render :new
    end
  end

  def destroy
    @circle = Circle.find(params[:id])
    @circle.destroy
    redirect_to user_url(current_user)
  end

  private

  def circle_params
    params.require(:circle).permit(:name, :owner_id, :member_ids => [])
  end
end