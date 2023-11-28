# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# db/seeds.rb

# Clear existing data
User.destroy_all
Event.destroy_all
Survey.destroy_all



puts "User en création ! "
# Create users
nicolas = User.create!(
  first_name: "Nicolas",
  last_name: "Cureau",
  email: "nicolas@gmail.com",
  password: "lewagon",
  password_confirmation: "lewagon"
)

jennifer = User.create!(
  first_name: "Jennifer",
  last_name: "crétal",
  email: "jennifer@gmail.com",
  password: "lewagon",
  password_confirmation: "lewagon"
)

marion = User.create!(
  first_name: "Marion",
  last_name: "Guédon",
  email: "Marion@gmail.com",
  password: "lewagon",
  password_confirmation: "lewagon"
)

# Add more users as needed

puts "Users créer sans problème !"


# db/seeds.rb

# Clear existing data

puts "Evenement en création ! "
# Create events
event1 = Event.create!(
  title: "Anniversaire de Marion",
  description: "Méga soirée à base de vin rouge !",
  start_at: Date.today + 1.week,
  end_at: Date.today + 1.week + 2.days,
  place: "Chez Marion"
)

event2 = Event.create!(
  title: "Soirée pétanque",
  description: "Ramenez bien vos jeu de boules",
  start_at: Date.today + 2.weeks,
  end_at: Date.today + 2.weeks + 1.day,
  place: "Dans les 48m² de chez Jennifer"
)


event3 = Event.create!(
  title: "Laser game",
  description: "Que du love, pas de guerre",
  start_at: Date.today - 2.weeks,
  end_at: Date.today - 2.weeks + 1.day,
  place: "Lille centre"
)

event4 = Event.create!(
  title: "Belotte",
  description: "Jai pas de jeu",
  place: "Liévin"
)

# Add more events as needed

puts "Evenement créer sans problème"



# db/seeds.rb

# Clear existing data

puts "On créer les surveys !"
# Create surveys
survey1 = Survey.create!(
  question: 'On le fait quand le birthday de la queen?',
  deadline: Date.today + 1.month,
  category: 'Date',
  user_id: User.first.id,
  event_id: Event.first.id
)

survey2 = Survey.create!(
  question: 'On adopte un chat ou un chien?',
  deadline: Date.today + 2.months,
  category: 'Autre',
  result: 'Pending',
  user_id: User.last.id,
  event_id: Event.last.id
)

# Add more surveys as needed

puts "C'est tout good :-)!"
