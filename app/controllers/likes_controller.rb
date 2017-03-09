class LikesController < ApplicationController

  def create
    user = session[:user_id]
  	idea = Idea.find(params[:idea_id])
  	like = Like.create(user_id: user, idea_id: params[:idea_id])
  	redirect_to '/ideas'

  end

end
