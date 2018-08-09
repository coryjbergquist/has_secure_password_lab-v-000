class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to controller: "welcome", action: "home"
    else
      flash[:alert] = "Please fill out all fields."
      redirect_to controller: "users", action: "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end