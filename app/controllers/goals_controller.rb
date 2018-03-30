class GoalsController < ApplicationController
  def index
    @goals = current_user.goals
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      redirect_to '/goals'
    else
      flash[:error] = "Sorry, there was an error. Please try again."
      render :new
    end
  end

  private
  def goal_params
    clean_params = params.require(:goal).permit(:description, :level, :focus_area)
    clean_params[:level] = clean_params[:level].downcase
    clean_params[:focus_area] = clean_params[:focus_area].downcase
    clean_params
  end
end
