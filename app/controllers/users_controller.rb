class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit]


  def index
    @users=User.all
    @user=current_user
    @book=Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def new
    @user=User.new
  end

  def create
    user = User.new(user_params)
    user.image = "default_icon.jpg"
    if user.save
      flash[:notice] = "successfully"
      redirect_to user_path(user.id)
    else
      flash[:notice] = "error"
      render :index
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice]="User was successfully updated."
      redirect_to user_path(@user.id)
    else
      flash[:notice]="error"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
     @user = User.find(params[:id])
     if @user != current_user
       redirect_to user_path(current_user)
     end
  end

end
