class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :ideas
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end


end
