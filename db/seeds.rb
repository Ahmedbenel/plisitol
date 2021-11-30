# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts 'Cleaning database...'
Child.destroy_all
User.destroy_all
Program.destroy_all
Platform.destroy_all

puts 'Creating 1 fake user...'
user = User.create!(email: 'user@plisitol.com', password: 'secret', username: "Anne O'Nyme")
user.photo.attach(io: URI.open('https://thispersondoesnotexist.com/image'), filename: 'file.jpg', content_type: 'image/jpg')
user.save!

puts 'Creating 3 fake children...'
sidonie = Child.create!(name: "Sidonie", user_id: user.id, age: 10)
sidonie.photo.attach(io: URI.open('https://thispersondoesnotexist.com/image'), filename: 'file.jpg', content_type: 'image/jpg')
sidonie.save!

freya = Child.create!(name: "Freya", user_id: user.id, age: 3)
freya.photo.attach(io: URI.open('https://thispersondoesnotexist.com/image'), filename: 'file.jpg', content_type: 'image/jpg')
freya.save!

lukas = Child.create!(name: "Lukas", user_id: user.id, age: 6)
lukas.photo.attach(io: URI.open('https://thispersondoesnotexist.com/image'), filename: 'file.jpg', content_type: 'image/jpg')
lukas.save!

puts 'Creating 7 platforms...'
netflix = Platform.create!(name: "Netflix")
netflix.photo.attach(io: URI.open('https://pbs.twimg.com/profile_images/1462784618768347145/aB8hqq4a_400x400.jpg'), filename: 'icon.jpg', content_type: 'image/png')
netflix.save!

amazon_prime = Platform.create!(name: "Amazon Prime")
amazon_prime.photo.attach(io: URI.open('https://images-na.ssl-images-amazon.com/images/I/41mpv9rBhmL.png'), filename: 'icon.jpg', content_type: 'image/png')
amazon_prime.save!

disney_plus = Platform.create!(name: "Disney+")
disney_plus.photo.attach(io: URI.open('https://static.wikia.nocookie.net/lemondededisney/images/4/43/Disney_logo.svg.png/revision/latest?cb=20200324125905&path-prefix=fr'), filename: 'icon.jpg', content_type: 'image/png')
disney_plus.save!

youtube = Platform.create!(name: "Youtube")
youtube.photo.attach(io: URI.open('https://yt3.ggpht.com/ytc/AKedOLTLjCRtFNjN93H-5cNhepnZy3x6ZNrmufpDo4n4zg=s900-c-k-c0x00ffffff-no-rj'), filename: 'icon.jpg', content_type: 'image/png')
youtube.save!

salto = Platform.create!(name: "Salto")
salto.photo.attach(io: URI.open('https://cdn2.clc2l.fr/t/s/a/salto-3xVKb_.png'), filename: 'icon.jpg', content_type: 'image/png')
salto.save!

ocs = Platform.create!(name: "OCS")
ocs.photo.attach(io: URI.open('https://www.ocs.fr/themes/ocs/img/OCS_ss_baseline.png'), filename: 'icon.jpg', content_type: 'image/png')
ocs.save!

canal_plus = Platform.create!(name: "Canal+")
canal_plus.photo.attach(io: URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Canal%2B.svg/langen-280px-Canal%2B.svg.png'), filename: 'icon.jpg', content_type: 'image/png')
canal_plus.save!

puts 'Creating fake accounts to platforms...'
account_netflix = Account.create!(user_id: user.id, platform_id: netflix.id)
account_netflix.save!

account_amazon_prime = Account.create!(user_id: user.id, platform_id: amazon_prime.id)
account_amazon_prime.save!

account_disney_plus = Account.create!(user_id: user.id, platform_id: disney_plus.id)
account_disney_plus.save!

puts 'Creating 10 programs...'
program = Program.create!(
  title: 'Paw Patrol',
  description: "Sous la houlette d'un garçon de 10 ans, une patrouille de six chiots héroïques accomplit des missions de sauvetage haletantes, avec beaucoup d'humour et d'intelligence.",
  category: 'Action',
  length: 23,
  platform: Platform.all.sample,
  min_age: 6,
  max_age: 8,
  program_url: "https://www.netflix.com/watch/81045782?trackId=14170096&tctx=1%2C0%2Cf4ba40a3-f810-49e5-aa41-a67bd4f1ca44-42576721%2C645f4eac-8cd9-43a0-b0e6-56c327b80691_59700367X19XX1637683379498%2C%2C"
)
program.photo.attach(io: URI.open('https://pictures.betaseries.com/fonds/original/10520_1375933.jpg'), filename: 'file.jpg', content_type: 'image/jpg')
program.save!

program = Program.create!(
  title: "T'choupi",
  description: "T’choupi, l’ami des tout-petits, est curieux, enthousiaste, et tellement affectueux… Mais il peut également être boudeur et têtu ! Avec ses parents, ses amis et surtout son inséparable Doudou, il va faire de palpitantes découvertes à travers ses jeux… et ses bêtises !",
  category: 'Educatif',
  length: 5,
  platform: Platform.all.sample,
  min_age: 3,
  max_age: 5,
  program_url: "https://www.netflix.com/watch/81101585?trackId=14170036&tctx=1%2C9%2Cf4ba40a3-f810-49e5-aa41-a67bd4f1ca44-41994387%2C645f4eac-8cd9-43a0-b0e6-56c327b80691_59700367X19XX1637683379498%2C%2C"
)
program.photo.attach(io: URI.open('https://pictures.betaseries.com/fonds/original/6901_1391272267.jpg'), filename: 'file.jpg', content_type: 'image/jpg')
program.save!

program = Program.create!(
  title: 'Peppa pig',
  description: 'Cette série met en scène une famille de cochons, la famille Pig, et particulièrement la fille, Peppa, qui adore rire et sauter à pieds joints dans les flaques de boue.',
  category: 'Animation',
  length: 20,
  platform: Platform.all.sample,
  min_age: 2,
  max_age: 4,
  program_url: "https://www.netflix.com/watch/81441579?trackId=254743534"
)
program.photo.attach(io: URI.open('https://pictures.betaseries.com/fonds/original/8379_990537.jpg'), filename: 'file.jpg', content_type: 'image/jpg')
program.save!

program = Program.create!(
  title: 'Il était une fois... la vie',
  description: "Cette série est destinée aux enfants et aux adultes curieux du fonctionnement de leur corps. Elle raconte de façon vulgarisée l'architecture et la composition des différents types cellulaires, des tissus biologiques et des organes ainsi que leurs fonctions respectives. De plus, ces descriptions microscopiques des composants du corps s'intègrent dans des scénarios pédagogiques traitant plus globalement du développement du corps humain, de ses fonctions physiologiques principales, du cycle de la vie et de l'éducation à la santé.",
  category: 'Educatif',
  length: 25,
  platform: Platform.all.sample,
  min_age: 7,
  max_age: 11,
  program_url: "https://www.betaseries.com/episode/ilaetaitunefoislavie/s01e01"
)
program.photo.attach(io: URI.open('https://pictures.betaseries.com/fonds/original/917_1458381023.jpg'), filename: 'file.jpg', content_type: 'image/jpg')
program.save!

program = Program.create!(
  title: 'Duck Tales',
  description: "Après s'être ignorés pendant 10 ans, Balthazar Picsou se réconcilie avec son neveu Donald Duck qui lui demande de surveiller ses trois neveux Riri, Fifi et Loulou. L'arrivée des trois jeunes canards réveille l'esprit d'aventures du multi-milliardaire qui décide de reprendre ses quêtes de trésors perdus, pendant que les trois garçons, avec l'aide de Zaza, la petite-fille de la gouvernante de Picsou, vont découvrir les raisons de la longue dispute entre Picsou et Donald.",
  category: 'Aventure',
  length: 22,
  platform: Platform.all.sample,
  min_age: 8,
  max_age: 12,
  program_url: "https://www.betaseries.com/episode/ducktales-2017/s01e01"
)
program.photo.attach(io: URI.open('https://pictures.betaseries.com/fonds/original/13732_62132088.jpg'), filename: 'file.jpg', content_type: 'image/jpg')
program.save!

program = Program.create!(
  title: 'RAYA and the last dragon',
  description: "Une quête pour sauver son monde. Il y a de cela fort longtemps, au royaume imaginaire de Kumandra, humains et dragons vivaient en harmonie. Mais un jour, une force maléfique s’abattit sur le royaume et les dragons se sacrifièrent pour sauver l’humanité. Lorsque cette force réapparait cinq siècles plus tard, Raya, une guerrière solitaire, se met en quête du légendaire dernier dragon pour restaurer l’harmonie sur la terre de Kumandra, au sein d’un peuple désormais divisé. Commence pour elle un long voyage au cours duquel elle découvrira qu’il lui faudra bien plus qu’un dragon pour sauver le monde, et que la confiance et l’entraide seront essentiels pour conduire au succès cette périlleuse mission.",
  category: 'Aventure',
  length: 107,
  platform: Platform.all.sample,
  min_age: 6,
  max_age: 120,
  program_url: "https://www.disneyplus.com/fr-fr/movies/raya-et-le-dernier-dragon/6dyengbx3iYK?irclickid=TZIV-jwZ4xyITxN1QhQVjUoNUkG2QqRZnVgVyc0&irgwc=1&cid=DSS-Affiliate-Impact-Content-BetaSeries-692369"
)
program.photo.attach(io: URI.open('https://fr.web.img6.acsta.net/r_1920_1080/pictures/21/05/11/10/35/1825655.jpg'), filename: 'file.jpg', content_type: 'image/jpg')
program.save!

program = Program.create!(
  title: 'Coco',
  description: "La célébration de toute une vie. Malgré la décevante absence totale de musique dans sa famille depuis des générations, Miguel rêve de devenir un grand musicien comme son idole Ernesto de la Cruz. Désespéré de pouvoir un jour montrer ses talents, il se retrouve à la suite d’un mystérieux enchaînement d’évènements dans l’incroyable et coloré Royaume des Morts. Sur sa route, il rencontre l’escroc charmeur Hector et ensemble, ils partent pour un voyage extraordinaire pour découvrir la véritable histoire cachée de la famille de Miguel.",
  category: 'Fantastique',
  length: 110,
  platform: Platform.all.sample,
  min_age: 10,
  max_age: 120,
  program_url: "https://www.canalplus.com/cinema/coco/h/15058385_50269"
)
program.photo.attach(io: URI.open('https://fr.web.img2.acsta.net/r_1920_1080/img/86/42/86423dfc4aea8afac1986c1c2c432879.jpg'), filename: 'file.jpg', content_type: 'image/jpg')
program.save!

program = Program.create!(
  title: "Chérie, j'ai rétréci les gosses",
  description: "L’aventure la plus étonnante et innovante de tous les temps ! Le facétieux professeur Wayne Szalinski a encore transformé sa maison en un vaste laboratoire et sa famille en cobayes. Sa dernière trouvaille : un rayon laser, capable de rétrécir les objets. Ses enfants, Amy et Nick, ainsi que leurs copains, Ron et Russ, en font malencontreusement l’expérience. Les voici réduits à la taille du Petit Poucet, confrontés à la jungle du jardin, où le moindre brin d’herbe prend des allures de baobab.",
  category: 'Comédie',
  length: 94,
  platform: Platform.all.sample,
  min_age: 7,
  max_age: 120,
  program_url: "https://www.disneyplus.com/fr-fr/movies/cherie-jai-retreci-les-gosses/53dNy2VPeJ8O?irclickid=TZIV-jwZ4xyITxN1QhQVjUoNUkG2QJVBnVgVyc0&irgwc=1&cid=DSS-Affiliate-Impact-Content-BetaSeries-692369"
)
program.photo.attach(io: URI.open('https://fr.web.img2.acsta.net/medias/nmedia/18/63/94/82/19631812.jpg'), filename: 'file.jpg', content_type: 'image/jpg')
program.save!

program = Program.create!(
  title: 'Guerre et paix dans le potager',
  description: "Guerre et paix dans le potager est un documentaire de 2006. Le premier épisode se déroule d’avril à août. Le deuxième épisode d’août à novembre. Des effets à expliquer aux plus petits, les accélérations du temps par les caméras, le jeu des proportions (insectes géants ou hommes vus en contre plongée pour donner des effets de taille). Il n’y a que 4 protagonistes humains, la famille qui jardine, deux adultes, deux enfants. Le reste des personnages sont les différents (et multiples) insectes qui peuplent leur potager.",
  category: 'Documentaire',
  length: 52,
  platform: Platform.all.sample,
  min_age: 5,
  max_age: 120,
  program_url: "https://www.youtube.com/watch?v=8C00YQBOyt4"
)
program.photo.attach(io: URI.open('http://www.13productions.fr/boutique/159-large_default/guerre-et-paix-dans-le-potager.jpg'), filename: 'file.jpg', content_type: 'image/jpg')
program.save!

program = Program.create!(
  title: 'Grizzy et les lemmings',
  description: "Il est gros comme un ours, fort comme un ours, intelligent... comme un ours. Aucun animal, c'est sûr, n'oserait contester ses privilèges dans toute la faune du Canada. A l'exception près d’un groupe issu de la famille la plus inoffensive, stupide et ridicule de tous les mammifères : les lemmings.",
  category: 'Animation',
  length: 7,
  platform: Platform.all.sample,
  min_age: 3,
  max_age: 7,
  program_url: "https://www.netflix.com/watch/81154175?trackId=14839166&tctx=-97%2C-97%2C%2C%2C%2C"
)
program.photo.attach(io: URI.open('https://pictures.betaseries.com/fonds/original/21638_1563645766.jpg'), filename: 'file.jpg', content_type: 'image/jpg')
program.save!

puts 'Creating fake watchings...'
  3.times do
    watching_8_days_ago = Watching.create!(program_id: Program.all.sample.id, user_id: user.id)
    watching_8_days_ago.created_at = (Date.today - 8)
    watching_8_days_ago.save!
  end

  3.times do
    watching_7_days_ago = Watching.create!(program_id: Program.all.sample.id, user_id: user.id)
    watching_7_days_ago.created_at = (Date.today - 7)
    watching_7_days_ago.save!
  end

  3.times do
    watching_6_days_ago = Watching.create!(program_id: Program.all.sample.id, user_id: user.id)
    watching_6_days_ago.created_at = (Date.today - 6)
    watching_6_days_ago.save!
  end

  3.times do
    watching_5_days_ago = Watching.create!(program_id: Program.all.sample.id, user_id: user.id)
    watching_5_days_ago.created_at = (Date.today - 5)
    watching_5_days_ago.save!
  end

  3.times do
    watching_4_days_ago = Watching.create!(program_id: Program.all.sample.id, user_id: user.id)
    watching_4_days_ago.created_at = (Date.today - 4)
    watching_4_days_ago.save!
  end

  3.times do
    watching_3_days_ago = Watching.create!(program_id: Program.all.sample.id, user_id: user.id)
    watching_3_days_ago.created_at = (Date.today - 3)
    watching_3_days_ago.save!
  end

  3.times do
    watching_2_days_ago = Watching.create!(program_id: Program.all.sample.id, user_id: user.id)
    watching_2_days_ago.created_at = (Date.today - 2)
    watching_2_days_ago.save!
  end

  3.times do
    watching_1_day_ago = Watching.create!(program_id: Program.all.sample.id, user_id: user.id)
    watching_1_day_ago.created_at = (Date.today - 1)
    watching_1_day_ago.save!
  end

  3.times do
    watching_today = Watching.create!(program_id: Program.all.sample.id, user_id: user.id)
    watching_today.created_at = (Date.today)
    watching_today.save!
  end

puts 'Creating fake children watchings...'

30.times do
  children_watching = ChildrenWatching.create!(child_id: Child.all.sample.id, watching_id: Watching.all.sample.id)
  children_watching.save!
end


puts 'Seed finished! 🌱'
