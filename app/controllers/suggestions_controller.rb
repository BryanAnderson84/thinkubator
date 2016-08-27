class SuggestionsController < ApplicationController
  before_action require: :user
  before_action :idea
  before_action :ocmments, only: [:show, :edit, :update, :destroy]


  def index
    @suggestion = @idea.suggestions
  end

  def show
  end

  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(comment_params)
    @suggestion[:idea_id] = params[:idea_id]
    if @comment.save
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @suggestion.update(suggestion_params)
      redirect_to idea_path
    else
      render :edit
    end
  end

  def destroy
    @suggestion.destroy
    redirect_to idea_path(@idea)
  end

  private

  def suggestions
    @suggestion = suggestion.find(params[:id])
  end

  def idea
    @idea = Idea.find(params[:idea_id])
  end

  def suggestion_params
    params.require(:suggestion).permit(:suggestion)
  end 
end
