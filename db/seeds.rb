# db/seeds.rb

# Suppression des données existantes
Attendance.destroy_all
Event.destroy_all
User.destroy_all

# Création d'un utilisateur créateur d'événements
creator = User.create!(
  first_name: "Florian",
  last_name: "Tribout",
  email: "test@gmail.com",
  encrypted_password: "your_password_here",  # Remplacez par un mot de passe valide
)

# Création d'un événement
event = Event.create!(
  title: "Mon Événement",
  description: "Description de l'événement.",
  start_date: Time.now + 1.day,  # L'événement est pour demain
  duration: 2,  # Durée en heures
  price: 20,  # Prix de l'événement
  location: "Paris",
  user_id: creator.id  # ID de l'utilisateur créateur
)

# Création d'un nouvel utilisateur participant
participant = User.create!(
  first_name: "Test",
  last_name: "Participant",
  email: "participant@example.com",
  encrypted_password: "your_password_here",  # Remplacez par un mot de passe valide
)

# Création d'une participation à l'événement
attendance = Attendance.create!(
  user_id: participant.id,  # ID de l'utilisateur participant
  event_id: event.id,       # ID de l'événement auquel il participe
  stripe_customer_id: "test_stripe_id"  # ID fictif pour éviter l'erreur de validation
)

puts "Seed data created successfully!"
