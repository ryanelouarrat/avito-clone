class Annonce < ApplicationRecord
  belongs_to :utilisateur
  has_many_attached :images
  validates :titre, :description, :prix, :localisation, :date_publication, :category, :transaction_type, presence: true
  validates :phone, presence: true
  validates :transaction_type, inclusion: { in: %w(sell buy), message: "%{value} is not a valid transaction type" }
  
  # Only validate images for new records
  validate :validate_images, on: :create
  
  private
  
  def validate_images
    # Require at least one image for new records
    if new_record? && images.blank?
      errors.add(:images, "au moins une image est requise")
    end
    
    # Always check maximum images
    if images.length > 5
      errors.add(:images, "maximum 5 images autorisées") 
    end
  end
end
