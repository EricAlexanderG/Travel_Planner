class UsersController < ApplicationController
  def new
      @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @users = User.all
    @trips = Trip.all
  end


  def create
      @user = User.create(user_params)
      if @user.save

          flash[:success] = "Welcome to the muthafuckin' club."
          redirect_to @user
      else
          render 'main'
      end
  end
  private
  def user_params
      params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end
end
