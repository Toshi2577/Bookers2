class UsersController < ApplicationController
  def new
    @book = Book.new
  end


  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books

  end

  before_action :ensure_current_user, {only: [:edit, :update]}
  def ensure_current_user
    if current_user.id != params[:id].to_i
      redirect_to user_path(current_user)
    end
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
