class SessionsController < ApplicationController
  def new
    # Render the login form
  end

  def create
    utilisateur = Utilisateur.find_by(email: params[:session][:email].downcase)
    if utilisateur && utilisateur.authenticate(params[:session][:password])
      # Log the user in
      session[:utilisateur_id] = utilisateur.id
      redirect_to root_path, notice: "Vous êtes maintenant connecté."
    else
      # Create an error message
      flash.now[:alert] = "Combinaison e-mail/mot de passe invalide"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # Log the user out
    session[:utilisateur_id] = nil
    redirect_to root_path, notice: "Vous avez été déconnecté."
  end
end
