class AssignmentsController < ApplicationController
  before_action require: :user
  before_action :idea
  before_action :assignment, only: [:show, :edit, :update, :destroy]

  def index
    @assignments = @idea.assignments
  end

  def show
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignment[:idea_id] = params[:idea_id]
    if @assignment.save
      redirect_to idea_assignments_path(@idea)
    else
      render :new
    end
  end

  def edit
    @assignment = @idea.assignment
  end

  def update
    if @assignment.update(assignment_params)
      redirect_to idea_assignments_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    @assignment.destroy
    redirect_to idea_assignments_path(@idea)
  end

  private

    def assignment_params
      params.require(:assignment).permit(:title, :description, :response, :completed, :user_id)
    end

    def assignment
      @assignment = Assignment.find(params[:id])
    end

    def idea
      @idea = Idea.find(params[:idea_id])
    end
end
