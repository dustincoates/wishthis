module HeaderHelper
  def member_or_non_member
    if @authenticated_user
      render :partial => 'shared/member_options'
    else
      render :partial => 'shared/non_member_options'
    end
  end
end