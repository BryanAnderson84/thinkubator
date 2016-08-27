class AssignmentsController < ApplicationController
  def index
    @assignment = @user.assignments
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    if @assignment.save
      redirect_to idea_assignments_path(@assignment)
    else
      render :new
    end
  end

  def edit
    @assignment = @current_user.assignment
  end

  def update
    @assignment = @current_user.assignment
    if @assignment.update
      redirect_to idea_assignment_path(@assignment)
    else
      render :edit
    end
  end

  def destroy
    @assignment.destroy
    redirect_to idea_assignments_path(@assignment)
  end

  private

    def assignment_params
      params.require(:assignment).permit(:title, :description, :response, :completed)
    end
end
