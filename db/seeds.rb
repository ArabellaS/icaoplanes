Booking.destroy_all# if Rails.env.development?
Plane.destroy_all# if Rails.env.development?
User.destroy_all# if Rails.env.development?

User.create!(
  name: "alexis",
  password: "azerty",
  email: "alexis@test.fr",
  dob: Date.new(1992, 11, 3)
)

User.create!(
  name: "cecile",
  password: "azerty",
  email: "cecile@test.fr",
  dob: Date.new(1992, 11, 3)
)

User.create!(
  name: "ouss",
  password: "azerty",
  email: "ouss@test.fr",
  dob: Date.new(1992, 11, 3)
)

plane_1 = Plane.create!(
  name: "Airbus A220-300",
  seats: 148,
  speed: 750,
  category: 3,
  description: "En tant que membre le plus grand de la famille A220, l'A220-300 est parfaitement adapté au marché des 120-160 sièges. Il représente la fusion entre la performance et la technologie, permettant aux compagnies aériennes de relier des points éloignés sur les continents et pour des secteurs de route qui étaient auparavant non rentables ou impossibles à réaliser.",
  address: "Toulouse",
  price: 300,
  user: User.first
)
file_1 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Airbus_A220-300.jpg/1024px-Airbus_A220-300.jpg")
plane_1.photo.attach(io: file_1, filename: "#{plane_1.name}_photo", content_type: 'image/*')

plane_2 = Plane.create!(
  name: "Toy",
  seats: 0,
  speed: 30,
  category: 1,
  description: "Les premiers vols exigent un avion radiocommandé d’une grande stabilité il faut donc s'orienter donc plutot vers un avion a aile Haute, plus stable et controlable",
  address: "Marseille",
  price: 30,
  user: User.first
)
file_2 = URI.open("https://m.media-amazon.com/images/I/51X6Sy72lLS._AC_SL1000_.jpg")
plane_2.photo.attach(io: file_2, filename: "#{plane_2.name}_photo", content_type: 'image/*')

plane_3 = Plane.create!(
  name: "Boeing B707",
  seats: 141,
  speed: 750,
  category: 3,
  description: "Le Boeing 707 est un avion de ligne quadriréacteur long-courrier à fuselage étroit construit par Boeing Commercial Airplanes entre 1958 et 1979 pour le marché civil, et jusqu'en 1991 pour les dérivés militaires.",
  address: "UK",
  price: 300,
  user: User.second
)
file_3 = URI.open("https://upload.wikimedia.org/wikipedia/commons/d/de/Boeing_707-138B_Qantas_Jett_Clipper_Ella_N707JT.jpg")
plane_3.photo.attach(io: file_3, filename: "#{plane_3.name}_photo", content_type: 'image/*')

plane_4 = Plane.create!(
  name: "Boeing B777-8",
  seats: 384,
  speed: 750,
  category: 3,
  description: "Le Boeing 777 ou B777, parfois surnommé triple sept dans le milieu aérien, est un avion de ligne gros porteur, long courrier et biréacteur construit par la société Boeing depuis 1994.",
  address: "UK",
  price: 300,
  user: User.second
)
file_4 = URI.open("https://brix.afklcargo.com/otf/images/media/FA6A2670-CE4E-4B1E-A31B624BD94A9A71")
plane_4.photo.attach(io: file_4, filename: "#{plane_4.name}_photo", content_type: 'image/*')

plane_5 = Plane.create!(
  name: "Falcon 2000",
  seats: 41,
  speed: 750,
  category: 2,
  description: "More than 550 Falcon 2000 series aircraft are in service today. Falcon operators praise the 2000 series for its robustness and reliability, its remarkable cost effectiveness and unmatched performance capabilities.",
  address: "France",
  price: 500,
  user: User.last
)
file_5 = URI.open("https://images.dassault-aviation.com/f_auto,q_auto,g_center,dpr_auto/wp-auto-upload/1/files/2016/03/150610_ER_Falcon2000MRA-1000.jpg")
plane_5.photo.attach(io: file_5, filename: "#{plane_5.name}_photo", content_type: 'image/*')

plane_6 = Plane.create!(
  name: "Airbus E-Plane",
  seats: 56,
  speed: 699,
  category: 1,
  description: "L'avion électrique est l'un des 34 plans industriels présentés par Arnaud Montebourg. EADS ambitionne de créer un appareil de 90-100 sièges disposant d'un système de propulsion hybride pour le marché régional, qui volerait en 2030. Pour se faire la main, un biplace construit par une nouvelle société, pourrait entrer en service en 2017 avec l'aide de plusieurs écoles ou universités.",
  address: "Brest",
  price: 1200,
  user: User.last
)
file_6 = URI.open("https://static.latribune.fr/full_width/132418/eads-e-fan.jpg")
plane_6.photo.attach(io: file_6, filename: "#{plane_6.name}_photo", content_type: 'image/*')

plane_7 = Plane.create!(
  name: "Airbus A380-800",
  seats: 575,
  speed: 1099,
  category: 3,
  description: "L'Airbus A380 est un avion de ligne civil très gros-porteur long-courrier quadriréacteur à double pont, produit par Airbus de 2004 à 2021. Ses éléments sont fabriqués et assemblés dans différents pays européens, principalement en France, en Allemagne, en Espagne et au Royaume-Uni. L'assemblage final est réalisé sur le site de Toulouse, en France.",
  address: "Toulouse",
  price: 855,
  user: User.last
)
file_7 = URI.open("https://www.challenges.fr/assets/img/2017/11/03/cover-r4x3w1000-59fc661054904-a380.jpg")
plane_7.photo.attach(io: file_7, filename: "#{plane_7.name}_photo", content_type: 'image/*')

