class UsersController < ApplicationController
  def new
    #render a view to signup!
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      redirect_to '/'
    else
      @message = 'Password did not match'
      render '/users/new'
      #render loads an erb view via path
      #it looks for them inside /app/views
    end

    #create some user and such
  end

  private
  #everything after private...is private!

  def user_params

    params.require(:user).permit(:name, :email, :password, :password_confirmation)

  end



end
