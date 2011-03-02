module ApplicationHelper

  def user_is_admin?
    current_user and current_user.email == "nti.rhadmin@gmail.com"
  end
end