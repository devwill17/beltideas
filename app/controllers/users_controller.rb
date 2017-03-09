class UsersController < ApplicationController
  def index
  end

  def new
  end

  def show
    @user = User.find(params[:id])
    @ideas = Idea.where(user: @user)
    @likes = Like.where(user: @user)
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to :new
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
    end

end
