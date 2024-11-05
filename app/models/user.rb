class User < ApplicationRecord 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :welcome_send    
    has_many :events  # Un utilisateur peut administrer plusieurs événements
    has_many :attendances  # Un utilisateur peut avoir plusieurs participations
    has_many :events_attended, through: :attendances, source: :event  # Un utilisateur participe à plusieurs événements
  
    has_many :events_administered, class_name: 'Event', foreign_key: 'user_id'
    def welcome_send    
      UserMailer.welcome_email(self).deliver_now  
    end 

end 