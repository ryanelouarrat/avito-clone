class Annonce < ApplicationRecord
  belongs_to :utilisateur
  validates :titre, :description, :prix, :localisation, :date_publication, :image, presence: true
end
