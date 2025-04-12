class AnnoncesController < ApplicationController
  before_action :set_annonce, only: [:show, :edit, :update, :destroy]

  def index
    @annonces = Annonce.all
  end

  def show
  end

  def new
    @annonce = Annonce.new
  end

  def create
    @annonce = Annonce.new(annonce_params)
    @annonce.utilisateur_id = 1  # Replace later with current_user.id

    if @annonce.save
      redirect_to @annonce, notice: "Annonce créée avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @annonce.update(annonce_params)
      redirect_to @annonce, notice: 'Annonce mise à jour avec succès.'
    else
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
  
end
