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
   if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to users_path
   else
    @user = current_user
    @books = Book.all
    render :books_path
   end
 end


 def index
  @user = current_user
  @book = Book.new
  @users = User.all
 end

  def update
   @user = current_user
   if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
   else
    render :edit
   end
  end


private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end