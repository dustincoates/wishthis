class ItemsController < ApplicationController

  def show
  end

  def edit
    if !@authenticated_user.nil?
      if @authenticated_user.user_type != "admin" && @authenticated_user != @user
        redirect_to root_path
      else
        @item = Item.find(params[:id]) if params[:id]
        @user = User.find(params[:user_id])
      end
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update_attributes(params[:item])
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def new
    #Left blank for now. In the future users may be able to add without bookmarklet.
  end

  def popup_add
    if !@authenticated_user.nil?
      @user = @authenticated_user
      @item = @user.items.build
    else
      redirect_to login_path
    end
  end

  def create
    binding.pry
    item = Item.new(params[:item])
    item.user_id = @authenticated_user.id
    if item.save
      redirect_to user_path(@authenticated_user)
    else
      render :new
    end
  end

  def destroy
    @item.destroy
    redirect_to user_path(@user)
  end

end