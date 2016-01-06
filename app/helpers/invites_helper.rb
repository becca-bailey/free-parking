module InvitesHelper
  def check_membership(group)
    group.members.include?(current_user)
  end
end
