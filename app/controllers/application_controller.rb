class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  helper_method :current_utilisateur, :logged_in?
  
  private
  
  def current_utilisateur
    @current_utilisateur ||= Utilisateur.find_by(id: session[:utilisateur_id]) if session[:utilisateur_id]
  end
  
  def logged_in?
    !current_utilisateur.nil?
  end
  
  def require_login
    unless logged_in?
      flash[:alert] = "Vous devez être connecté pour accéder à cette page"
      redirect_to login_path
    end
  end
end
