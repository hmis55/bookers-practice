class UsersController < ApplicationController


 def edit
  @user = User.find(params[:id])
 end

 def show
  @user = User.find(params[:id])
  @book = Book.new
  @books = @user.books
 end

 def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   @book.save
   redirect_to users_path
 end


 def index
  @user = current_user
  @book = Book.new
  @users = User.all
 end

 def update
  @user = current_user
  @user.update(use_params)
  redirect_to book_path(user_params)

 end


private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end