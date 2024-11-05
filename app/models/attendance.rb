class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :stripe_customer_id, presence: true, uniqueness: true

  after_create :notify_event_creator

  private

  def notify_event_creator
    # Appelle le mailer pour envoyer un email au créateur de l'événement
    EventMailer.notify_creator(self).deliver_now
  end
end
