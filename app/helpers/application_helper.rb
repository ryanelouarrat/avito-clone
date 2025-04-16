module ApplicationHelper
  # Temporary method to handle current user until authentication is fully implemented
  def current_user
    # Currently using static user ID = 1
    Utilisateur.find_by(id: 1)
  rescue
    nil
  end
  
  # Helper to check if user is logged in
  def logged_in?
    !current_user.nil?
  end
end
