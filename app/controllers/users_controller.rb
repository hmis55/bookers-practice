class UsersController < ApplicationController


 def edit
 end

 def show
  @user = User.find(params[:id])
 end

 def create
   @books = book.new(book_params)
   @book.user_id = current_user_id
   @book.save
   redirect_to users_@path
 end


 def index
  @user = current_user
  @book = Book.new
  @users = User.all
 end

 def update
 end


private
  def book_params
    params.require(:book).permit(:title,:opinion)
  end
end
