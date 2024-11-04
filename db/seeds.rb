# db/seeds.rb

# Suppression des données existantes
Attendance.destroy_all
Event.destroy_all
User.destroy_all

# Création d'utilisateurs
users = User.create([
  {
    first_name: "Florian",
    last_name: "Dupont",
    email: "florian@example.com",
    description: "Un utilisateur de test.",
    encrypted_password: "votre_mot_de_passe"
  },
  {
    first_name: "Alice",
    last_name: "Martin",
    email: "alice@example.com",
    description: "Un autre utilisateur de test.",
    encrypted_password: "votre_mot_de_passe"
  },
  {
    first_name: "Bob",
    last_name: "Durand",
    email: "bob@example.com",
    description: "Un utilisateur encore un autre.",
    encrypted_password: "votre_mot_de_passe"
  },
  {
    first_name: "Charlie",
    last_name: "Bernard",
    email: "charlie@example.com",
    description: "Passionné de musique.",
    encrypted_password: "votre_mot_de_passe"
  },
  {
    first_name: "David",
    last_name: "Leroy",
    email: "david@example.com",
    description: "Fan de technologies.",
    encrypted_password: "votre_mot_de_passe"
  }
])

# Création d'événements associés aux utilisateurs
events = Event.create([
  {
    title: "Concert de Jazz",
    description: "Un concert de jazz incroyable.",
    start_date: DateTime.now + 2.days,
    duration: 120,
    price: 20,
    location: "Salle de Concert",
    user: users[0]  # Associé à Florian
  },
  {
    title: "Exposition d'Art",
    description: "Une exposition d'art contemporain.",
    start_date: DateTime.now + 5.days,
    duration: 180,
    price: 15,
    location: "Galerie d'Art",
    user: users[1]  # Associé à Alice
  },
  {
    title: "Atelier de Cuisine",
    description: "Un atelier de cuisine italienne.",
    start_date: DateTime.now + 1.week,
    duration: 90,
    price: 30,
    location: "Centre de Loisirs",
    user: users[2]  # Associé à Bob
  }
])

# Création de participations (Attendances)
Attendance.create([
  { user: users[0], event: events[0], stripe_customer_id: "cus_001" }, # Florian participe au Concert de Jazz
  { user: users[1], event: events[0], stripe_customer_id: "cus_002" }, # Alice participe au Concert de Jazz
  { user: users[2], event: events[1], stripe_customer_id: "cus_003" }, # Bob participe à l'Exposition d'Art
  { user: users[3], event: events[1], stripe_customer_id: "cus_004" }, # Charlie participe à l'Exposition d'Art
  { user: users[4], event: events[2], stripe_customer_id: "cus_005" }, # David participe à l'Atelier de Cuisine
  { user: users[0], event: events[2], stripe_customer_id: "cus_006" }  # Florian participe à l'Atelier de Cuisine
])

puts "Création de #{users.count} utilisateurs, #{events.count} événements et #{Attendance.count} participations."
