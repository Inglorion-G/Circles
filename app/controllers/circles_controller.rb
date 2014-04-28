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
    @circle = Circle.new(circle_params)
    if @circle.save!
      redirect_to @circle
    else
      flash.now[:errors] = @circle.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def circle_params
    params.require(:circle).permit(:name, :owner_id, :member_ids => [])
  end
end