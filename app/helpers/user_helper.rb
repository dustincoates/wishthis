module UserHelper
  def show_wishlist_items
    if @user.items.count > 0
      render 'wishlist_items'
    end
  end

  def show_bookmarklet
    if @user = @authenticated_user
      render 'bookmarklet'
    end
  end
end