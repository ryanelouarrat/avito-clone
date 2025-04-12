class Annonce < ApplicationRecord
  belongs_to :utilisateur
  has_many_attached :images
  validates :titre, :description, :prix, :localisation, :date_publication, :category, :transaction_type, presence: true
  validates :transaction_type, inclusion: { in: %w(sell buy), message: "%{value} is not a valid transaction type" }
  validate :validate_images
  
  private
  
  def validate_images
    errors.add(:images, "au moins une image est requise") if images.blank?
    errors.add(:images, "maximum 5 images autorisées") if images.length > 5
  end
end
