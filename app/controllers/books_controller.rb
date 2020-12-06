class BooksController < ApplicationController

 before_action :authenticate_user!
 before_action :correct_book, only: [:edit]

  def index
    @books=Book.all
    @users=User.all
    @user=current_user
    @book=Book.new
  end

  def show
    @user=current_user
    @book = Book.find(params[:id])
    @users=User.all
    @books=Book.new
  end

  def new
    @book=Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save

      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      @user=current_user
      @books=Book.all
      flash[:notice] = "error"
      render :index
    end

  end

  def edit
     @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    @user=current_user
    @books=Book.all
    if @book.save
      flash[:notice]="Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      flash[:notice]="error"
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice]="Book was successfully destroyed."
    redirect_to books_path
  end


  private

    def correct_book
     book = Book.find(params[:id])
      if book.user != current_user
       flash[:notice]="許可されていません"
       redirect_to books_path
      end
    end

    def book_params
     params.require(:book).permit(:title, :body)
    end
end
