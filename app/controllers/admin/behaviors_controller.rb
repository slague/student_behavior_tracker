class Admin::BehaviorsController < ApplicationController
  before_action :set_behavior, only: [:show, :edit, :update, :destroy]
  before_action :require_admin


    def require_admin
      render file: "/public/404" unless current_admin?
    end


  def index
    @behaviors = Behavior.all
  end

  def show
  end

  def new
   @behavior = Behavior.new
  end

  def create
    @behavior = Behavior.new(behavior_params)

    if @behavior.save
      redirect_to admin_behaviors_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @behavior.update(behavior_params)
      redirect_to admin_behaviors_path
    else
      render :edit
    end
  end

  def destroy
    @behavior.destroy
    redirect_to admin_behaviors_path
  end


  private

  def set_behavior
    @behavior = Behavior.find(params[:id])
  end

  def behavior_params
    params.require(:behavior).permit(:keyword)
  end

end
