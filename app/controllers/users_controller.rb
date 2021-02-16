class UsersController < ApplicationController
  # before_action :autheniticate_user, {only: [:index, :show, :edit, :update]}
  # def autheniticate_user
  #   if @current_path == nil
  #     redirect_to user_session_path
  #   end
  # end
  def index
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
    flash[:notice] = "ユーザー情報を更新しました！"
    redirect_to user_path(@user.id)
 else
    render :edit
 end
  end

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
