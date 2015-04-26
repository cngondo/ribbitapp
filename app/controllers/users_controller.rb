class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(new_user)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thank you for signing up for Ribbit!"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @ribbit = Ribbit.new
  end

  private
  def new_user
    params.require(:user).permit(:avatar_url, :email, :name, :password, :password_confirmation, :username)
  end
end
