class SessionController < ApplicationController
  skip_before_filter :authenticate_user #Avoids a redirect loop if user isn't authenticated.

  def new
  end
  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:username] = @user.username
      session[:id] = @user[:id]
      if session[:return_to]
        redirect_to session[:return_to]
        session[:return_to] = nil
      else
        redirect_to user_path(@user)
      end
    else
      render :new
    end
  end

  def destroy
    #Session was maintaining the same :id even after logout.
    #This will reset it all.
    reset_session
    redirect_to root_path
  end
end