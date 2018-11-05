class UserController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user.new(user_params)
    if @user.save
      flash[:success] = "You've successfully signed up, welcome !"
    else
      flash[:danger] = "Sign-up failed, please try again."
    end
  end
  
  def destroy
    @user.destroy
    flash[:info] = "Account successfullt deleted, sorry to see you go."
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
