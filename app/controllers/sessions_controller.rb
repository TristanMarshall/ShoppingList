class SessionsController < ApplicationController
  def new
    #show us a log in form!
  end

  def create
    #post request to validate/create a session
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
    ##Successful log in
    session[:useer_id] = @user.id
    redirect_to '/'
    else
    @message = "Username or password is incorrect"
    render '/sessions/new'
  end

  def delete
    #delete/destroy the session
    session[:user_id] = nil
    redirect_to '/users/login'
  end
end
