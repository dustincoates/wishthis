module ItemHelper
  def delete_item_link(item)
    if @user = @authenticated_user
      link_to "Delete", user_item_path(@user, item), :method => :delete
    end
  end
end