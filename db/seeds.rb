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

nicolas = User.create!(
  first_name: "Nicolas",
  last_name: "Cureau",
  email: "nicolas@gmail.com",
  password: "lewagon",
  password_confirmation: "lewagon"
)

jennifer = User.create!(
  first_name: "Jennifer",
  last_name: "Crétal",
  email: "jennifer@gmail.com",
  password: "lewagon",
  password_confirmation: "lewagon"
)

marion = User.create!(
  first_name: "Marion",
  last_name: "Guédon",
  email: "marion@gmail.com",
  password: "lewagon",
  password_confirmation: "lewagon"
)

photo_marion = URI.open("https://avatars.githubusercontent.com/u/137996776?v=4")
photo_jf = URI.open("https://avatars.githubusercontent.com/u/109537083?v=4")
photo_nicolas = URI.open("https://avatars.githubusercontent.com/u/147147521?v=4")

marion.avatar.attach(io: photo_marion, filename: "marion.jpg", content_type: "image/jpg")
jennifer.avatar.attach(io: photo_jf, filename: "jf.jpg", content_type: "image/jpg")
nicolas.avatar.attach(io: photo_nicolas, filename: "nicolas.jpg", content_type: "image/jpg")


# Add more users as needed

puts "Users créés sans problème !"


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

#adding photos to events

photo1 = URI.open("https://www.toutelanutrition.com/media/cache/terravita_blog_article_thumbnail_medium/blog/wikifit-sante-conseil-vin-rouge-les-bienfaits-du-resveratrol.jpg")
photo2 = URI.open("https://www.bandoltourisme.fr/wp-content/uploads/2021/03/Petanque-boules.jpg")
photo3 = URI.open("https://cdn.sortiraparis.com/images/80/66131/907451-laser-game-notre-selection-des-spots-ou-pratiquer-a-paris-et-en-ile-de-france.jpg")
photo4 = URI.open("https://fac.img.pmdstatic.net/fit/https.3A.2F.2Fi.2Epmdstatic.2Enet.2Ffac.2F2023.2F09.2F05.2F53fc7fd8-8c1f-489e-8416-f5ce7b35e4b1.2Ejpeg/970x485/quality/80/crop-from/center/belote-les-meilleurs-sites-et-applis-pour-jouer-gratuitement-en-ligne.jpeg")

event1.photos.attach(io: photo1, filename: "vin.jpg", content_type: "image/jpg")
event2.photos.attach(io: photo2, filename: "pétanque.jpg", content_type: "image/jpg")
event3.photos.attach(io: photo3, filename: "pétanque.jpg", content_type: "image/jpg")
event4.photos.attach(io: photo4, filename: "belote.jpeg", content_type: "image/jpg")


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
