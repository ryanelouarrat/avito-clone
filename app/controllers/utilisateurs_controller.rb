class UtilisateursController < ApplicationController
  before_action :require_login, only: [:edit, :update]
  before_action :correct_utilisateur, only: [:edit, :update]
  
  def new
    @utilisateur = Utilisateur.new
  end
  
  def create
    @utilisateur = Utilisateur.new(utilisateur_params)
    if @utilisateur.save
      # Log in the user after sign up
      session[:utilisateur_id] = @utilisateur.id
      redirect_to root_path, notice: "Bienvenue ! Votre compte a été créé avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @utilisateur = Utilisateur.find(params[:id])
  end
  
  def edit
    @utilisateur = Utilisateur.find(params[:id])
  end
  
  def update
    @utilisateur = Utilisateur.find(params[:id])
    
    # Handle password update
    if params[:utilisateur][:password].blank? && params[:utilisateur][:password_confirmation].blank?
      params[:utilisateur].delete(:password)
      params[:utilisateur].delete(:password_confirmation)
    end
    
    if @utilisateur.update(utilisateur_params)
      redirect_to @utilisateur, notice: "Profil mis à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private
  
  def utilisateur_params
    params.require(:utilisateur).permit(
      :nom, 
      :email, 
      :ville, 
      :telephone, 
      :password, 
      :password_confirmation,
      :profile_picture
    )
  end
  
  def correct_utilisateur
    @utilisateur = Utilisateur.find(params[:id])
    unless current_utilisateur == @utilisateur
      redirect_to root_path, alert: "Vous n'êtes pas autorisé à effectuer cette action."
    end
  end
end
