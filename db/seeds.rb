
# db/seeds.rb

# Clear existing data
User.destroy_all
Event.destroy_all
Survey.destroy_all
UserEvent.destroy_all

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

juan = User.create!(
  first_name: "Juan",
  last_name: "Desitter",
  email: "juan@gmail.com",
  password: "lewagon",
  password_confirmation: "lewagon"
)

guillaume = User.create!(
  first_name: "Guillaume",
  last_name: "Ingrin",
  email: "guillaume@gmail.com",
  password: "lewagon",
  password_confirmation: "lewagon"
)


photo_guillaume = URI.open("https://i.etsystatic.com/21647555/r/il/2d7fdd/3470674713/il_570xN.3470674713_iqet.jpg")
photo_juan = URI.open("https://lens-storage.storage.googleapis.com/png/b2b053e9327841408e129b45a3868396")
photo_marion = URI.open("https://avatars.githubusercontent.com/u/137996776?v=4")
photo_jf = URI.open("https://avatars.githubusercontent.com/u/109537083?v=4")
photo_nicolas = URI.open("https://avatars.githubusercontent.com/u/147147521?v=4")

marion.avatar.attach(io: photo_marion, filename: "marion.jpg", content_type: "image/jpg")
jennifer.avatar.attach(io: photo_jf, filename: "jf.jpg", content_type: "image/jpg")
nicolas.avatar.attach(io: photo_nicolas, filename: "nicolas.jpg", content_type: "image/jpg")
juan.avatar.attach(io: photo_juan, filename: "juan.jpg", content_type: "image/jpg")
guillaume.avatar.attach(io: photo_guillaume, filename: "guillaume.jpg", content_type: "image/jpg")

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

user_event_1 = UserEvent.create!(
  user: nicolas,
  event: event1,
  planner: false,
  status: 'pending'
)

user_event1 = UserEvent.create!(
  user: jennifer,
  event: event1,
  planner: false,
  status: 'pending'
)

user_event1_planner = UserEvent.create!(
  user: marion,
  event: event1,
  planner: true,
  status: 'going'
)

user_event_2 = UserEvent.create!(
  user: nicolas,
  event: event2,
  planner: false,
  status: 'pending'
)

user_event2 = UserEvent.create!(
  user: jennifer,
  event: event2,
  planner: false,
  status: 'pending'
)

user_event2_planner = UserEvent.create!(
  user: marion,
  event: event2,
  planner: true,
  status: 'going'
)


user_event_3 = UserEvent.create!(
  user: nicolas,
  event: event3,
  planner: false,
  status: 'pending'
)


user_event3 = UserEvent.create!(
  user: jennifer,
  event: event3,
  planner: false,
  status: 'pending'
)

user_event3_planner = UserEvent.create!(
  user: marion,
  event: event3,
  planner: true,
  status: 'going'
)

user_event_4 = UserEvent.create!(
  user: nicolas,
  event: event4,
  planner: false,
  status: 'pending'
)

user_event4 = UserEvent.create!(
  user: jennifer,
  event: event4,
  planner: false,
  status: 'pending'
)

user_event4_planner = UserEvent.create!(
  user: marion,
  event: event4,
  planner: true,
  status: 'going'
)

#adding photos to events

photo1 = URI.open("https://www.toutelanutrition.com/media/cache/terravita_blog_article_thumbnail_medium/blog/wikifit-sante-conseil-vin-rouge-les-bienfaits-du-resveratrol.jpg")
photo2 = URI.open("https://www.bandoltourisme.fr/wp-content/uploads/2021/03/Petanque-boules.jpg")
photo3 = URI.open("https://cdn.sortiraparis.com/images/80/66131/907451-laser-game-notre-selection-des-spots-ou-pratiquer-a-paris-et-en-ile-de-france.jpg")
photo4 = URI.open("https://fac.img.pmdstatic.net/fit/https.3A.2F.2Fi.2Epmdstatic.2Enet.2Ffac.2F2023.2F09.2F05.2F53fc7fd8-8c1f-489e-8416-f5ce7b35e4b1.2Ejpeg/970x485/quality/80/crop-from/center/belote-les-meilleurs-sites-et-applis-pour-jouer-gratuitement-en-ligne.jpeg")

event1.photo_banner.attach(io: photo1, filename: "vin.jpg", content_type: "image/jpg")
event2.photo_banner.attach(io: photo2, filename: "pétanque.jpg", content_type: "image/jpg")
event3.photo_banner.attach(io: photo3, filename: "pétanque.jpg", content_type: "image/jpg")
event4.photo_banner.attach(io: photo4, filename: "belote.jpeg", content_type: "image/jpg")


puts "Evenement créer sans problème"



# db/seeds.rb

# Clear existing data

puts "On créer les surveys !"
# Create surveys
survey1 = Survey.create!(
  question: 'Soirée déguisée?',
  deadline: Date.today + 1.month,
  category: 'Autre',
  user: marion,
  event: event1
)

survey2 = Survey.create!(
  question: 'On ramène les enfants?',
  deadline: Date.today + 2.months,
  category: 'Autre',
  result: 'Pending',
  user: nicolas,
  event: event1
)

# Ajouter des réponses aux sondages
answer1_survey1 = Answer.create!(
  content: 'Oui',
  survey_id: survey1.id # Assurez-vous d'utiliser l'ID du sondage
)

answer2_survey1 = Answer.create!(
  content: 'Non',
  survey_id: survey1.id # Assurez-vous d'utiliser l'ID du sondage
)

answer1_survey2 = Answer.create!(
  content: 'Carrément !',
  survey_id: survey2.id # Assurez-vous d'utiliser l'ID du sondage
)

answer2_survey2 = Answer.create!(
  content: 'Même pas en rêve',
  survey_id: survey2.id # Assurez-vous d'utiliser l'ID du sondage
)


# Add more surveys as needed

puts "C'est tout good :-)!"
