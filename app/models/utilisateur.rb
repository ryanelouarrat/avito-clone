class Utilisateur < ApplicationRecord
  has_secure_password
  has_many :ads
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'
  has_one_attached :profile_picture
  
  validates :email, presence: true, uniqueness: { case_sensitive: false }, 
                   format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :nom, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
