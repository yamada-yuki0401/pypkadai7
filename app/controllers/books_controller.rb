class BooksController < ApplicationController

 def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
    flash[:success] = "You have created book successfully."
    redirect_to book_path(@book)
   else
     @user = current_user
     @books = Book.all
     render "index"
   end
 end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @booker = Book.find(params[:id])
    @books = @booker.user.books.all
    @user = @booker.user
    @book = Book.new
  end
  def edit
    @book = Book.find(params[:id])
    if not @book.user == current_user
      redirect_to books_path
    end
  end
  def update
    @book = Book.find(params[:id])
if  @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
else
    render :edit

end
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
