class IdeasController < ApplicationController
  def index
   @user = User.find(session[:user_id])
   @ideas = Idea.all
  # @ideas = Idea.joins(:likes).merge(Like.count)
  # @ideas = Idea.all.sort(:likes 'DESC')
  end

  def show
    @user = User.find(session[:user_id])
    @idea = Idea.find(params[:id])
    @likes = @idea.users.distinct
  end

  def create
    @user = User.find(session[:user_id])
    @idea = Idea.new(content: params[:content], user_id: @user.id)
    if @idea.save
      redirect_to '/ideas'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/ideas'
    end
  end

  def destroy
    Idea.find(params[:id]).delete
    redirect_to "/ideas"
  end

end
