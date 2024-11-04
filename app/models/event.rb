class Event < ApplicationRecord
  belongs_to :user  # L'événement appartient à un utilisateur (administrateur)

  has_many :attendances  # Un événement peut avoir plusieurs participations
  has_many :participants, through: :attendances, source: :user  # Utilisateurs participants via les participations
end
