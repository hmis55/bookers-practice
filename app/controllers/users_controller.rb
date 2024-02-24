class UsersController < ApplicationController


 def edit
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to users_path
 end

 def show
  @user = User.find(params[:id])
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
 end


private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
