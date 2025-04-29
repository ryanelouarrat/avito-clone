class AnnoncesController < ApplicationController
  before_action :set_annonce, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :hide_header, only: [:new, :edit]

  def index
    # Eager load utilisateur and images for efficient queries
    @annonces = Annonce.includes(:utilisateur, images_attachments: :blob)
    # Search functionality
    @annonces = @annonces.where("titre LIKE ? OR description LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%") if params[:q].present?
    @annonces = @annonces.where(category: params[:category]) if params[:category].present?
    @annonces = @annonces.where(localisation: params[:localisation]) if params[:localisation].present?
    @annonces = @annonces.where(transaction_type: params[:transaction_type]) if params[:transaction_type].present?
    # Paginate results to reduce load
    @annonces = @annonces.page(params[:page]).per(12)
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
    # Assign basic attributes excluding image params
    attrs = annonce_params.except(:images, :remove_image_ids)
    @annonce.assign_attributes(attrs)
    
    # Purge any images marked for removal
    Array(params.dig(:annonce, :remove_image_ids)).each do |id|
      img = @annonce.images.find_by(id: id)
      img.purge if img
    end
    
    # Attach any newly uploaded images
    Array(params.dig(:annonce, :images)).each do |img|
      @annonce.images.attach(img) if img.respond_to?(:content_type)
    end
    
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
      :titre, :description, :prix, :localisation, :date_publication, :category, :transaction_type,
      :phone, :phone_hidden,
      images: [], remove_image_ids: []
    )
  end
  
  def hide_header
    @hide_header = true
  end
end
