class AnnoncesController < ApplicationController
  before_action :set_annonce, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :hide_header, only: [:new, :edit]

  def index
    @annonces = Annonce.all
    
    # Search functionality
    @annonces = @annonces.where("titre LIKE ? OR description LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%") if params[:q].present?
    @annonces = @annonces.where(category: params[:category]) if params[:category].present?
    @annonces = @annonces.where(localisation: params[:localisation]) if params[:localisation].present?
  end

  def show
  end

  def new
    @annonce = Annonce.new
  end

  def create
    @annonce = Annonce.new(annonce_params)
    @annonce.utilisateur_id = current_utilisateur.id
    @annonce.date_publication = Time.current

    if @annonce.save
      redirect_to @annonce, notice: "Annonce créée avec succès !"
    else
      @hide_header = true
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @annonce.assign_attributes(annonce_params)
    
    # Only update the date if it's a significant edit
    # Alternatively, you could keep the original date by commenting this out
    # @annonce.date_publication = Time.current

    if @annonce.save
      redirect_to @annonce, notice: 'Annonce mise à jour avec succès.'
    else
      @hide_header = true
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @annonce.destroy
    redirect_to annonces_path, notice: 'Annonce supprimée avec succès.'
  end

  private

  def set_annonce
    @annonce = Annonce.find(params[:id])
  end

  def annonce_params
    params.require(:annonce).permit(
      :titre, :description, :prix, :localisation, :date_publication, :category, :transaction_type, images: []
    )
  end
  
  def hide_header
    @hide_header = true
  end
end
