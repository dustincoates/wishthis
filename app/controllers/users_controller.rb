class UsersController < ApplicationController
  before_filter :find_user
  private
  def find_user
    @user = User.find(params[:id]) if params[:id]
  end

  def index
    #There is currently no view associated with this action.
    #There will be (admin-gated) in next version.
    @users = User.all
  end

  def show
    @items = Item.where(:user_id => @user.id)
    if request.path != user_path(@user)
      redirect_to @user, status: :moved_permanently
    end
  end

  def edit
    if !@authenticated_user.nil?
      if @authenticated_user.user_type != "admin" && @authenticated_user != @user
        redirect_to user_path(@user)
      end
    else
      redirect_to root_path
    end
  end

  def change_password
    if !@authenticated_user.nil?
      if @authenticated_user.user_type != "admin" && @authenticated_user != @user
        redirect_to user_path(@user)
      end
    else
      redirect_to root_path
    end
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def new
    if @authenticated_user && @authenticated_user.user_type != "admin"
      redirect_to root_path
    end
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:username] = @user.username
      session[:id] = @user[:id]
      redirect_to new_user_map_path(@user)
    else
      render :new
    end
  end

  def destroy
    if @user != @authenticated_user && @authenticated_user.user_type != "admin"
      redirect_to root_path
    else
      reset_session #Bad things happen if you don't reset the session.
      @user.delete
      redirect_to root_path
    end
  end

end