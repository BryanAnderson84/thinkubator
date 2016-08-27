class IdeasController < ApplicationController
  before_action :idea, except: [:index, :new, :create]
  def index
    @ideas = Idea.all
  end

  def show
  end

  def new
    @idea = Bucketlist.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = current_user.id
    if @idea.save
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @idea.update(idea_params)
    redirect_to idea_path(@idea)
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end

  def idea
    @idea = Idea.find(params[:id])
  end

end
