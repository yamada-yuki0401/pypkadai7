class UsersController < ApplicationController

  def index
    @user = User.find(params[:id])
    @users = User.all
    @book = Book.new
  end
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @book = @user.books.all
  end
  def edit
    @user = User.find(params[:id])
    # logger.debug(@user.id)
    # logger.debug(current_user.id)
     if not @user.id == current_user.id
      redirect_to user_path(current_user)
     end
  end
  def update
    @user = User.find(params[:id])
 if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
 else
    render :edit
 end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
