puts "Cleaning database..."
Order.destroy_all
UserFoodPreference.destroy_all
UserSubscription.destroy_all
Restaurant.destroy_all
Meal.destroy_all
User.destroy_all
Category.destroy_all
Subscription.destroy_all

##################################################

## Static data

puts "Creating subscriptions..."


Subscription.create!(price: 30, meals_count:5, name:"L'avant-goût", description: "Découvrez mes midis pendant une semaine")
Subscription.create!(price: 79, meals_count: 12, name: "Le Sublime", description: "Vous donne droit à 12 repas au cours du mois")
Subscription.create!(price: 119, meals_count: 20, name: "Le Gargantuesque", description: "Vous donne droit à 20 repas au cours du mois")



puts "Creating categories..."
["Américain", "Asiatique", "Latin", "Méditerranéen", "Italien", "Végétarien"].each do |name|
  Category.create!(name: name)
end

##################################################
##################################################

puts "Creating users..."
thomas = User.create!(first_name: "Thomas", last_name: "Commercial", email: "thomas@gmail.com", password: "123456", password_confirmation: "123456", address: "32 rue Fouré", zip_code: "44000", city: "Nantes", phone_number: "0645234565", time_slot: "12h00-12h15")

karim = User.create!(first_name: "Karim", last_name: "Garcia", email: "karim_garcia@gmail.com", password: "654321", password_confirmation: "654321", address: "32 rue du Chateau", zip_code: "44000", city: "Nantes", phone_number: "0610203040", time_slot: "13h00-13h15")

cecile = User.create!(first_name: "Cecile", last_name: "Veneziani", email: "cecile@gmail.com", password: "135790", password_confirmation: "135790", address: "10 rue des Fleurs", zip_code: "44200", city: "Nantes", phone_number: "0615202530", time_slot: "13h30-13h45")

# TODO: User food preferences



##################################################
puts "Creating restaurants..."

cantina = Restaurant.create!(name:"A CANTINA", address:"28 rue Kervegan", zip_code:"44000", city:"NANTES",latitude: 47.2125614, longitude: -1.5565375, phone: "02 40 47 68 83", time_slot: "12", picture: File.new(Rails.root.join("db/fixtures/images/restaurants/a-cantina.jpg")),password:"123456", password_confirmation:"123456",email: "a-cantina@gmail.com")
rafael = Restaurant.create!(name:"CHEZ RAFAËL", address:"4 rue Emile Masson", zip_code:"44000", city:"NANTES",latitude: 47.2140058, longitude: -1.5462642, phone: "02 40 20 42 27", time_slot: "12", picture: File.new(Rails.root.join("db/fixtures/images/restaurants/chez-rafael.jpg")),password:"123456", password_confirmation:"123456",email: "chez-rafael@gmail.com")
alain = Restaurant.create!(name:"L'ATELIER D'ALAIN", address:"24 Rue des Olivettes", zip_code:"44000", city:"NANTES",latitude: 47.2106165, longitude: -1.5492767, phone: "02 40 84 38 66", time_slot: "12", picture: File.new(Rails.root.join("db/fixtures/images/restaurants/atelier-alain.jpg")),password:"123456", password_confirmation:"123456",email: "atelier-alain@gmail.com")
raffinerie = Restaurant.create!(name:"LA RAFFINERIE", address:"54 rue Fouré ", zip_code:"44000", city:"NANTES",latitude: 47.2103878, longitude: -1.5472457, phone: "02 40 74 81 05", time_slot: "12", picture: File.new(Rails.root.join("db/fixtures/images/restaurants/la-raffinerie.jpg")),password:"123456", password_confirmation:"123456",email: "la-raffinerie@gmail.com")
coteplage = Restaurant.create!(name:"LE CÔTÉ PLAGE", address:"14 allée Turenne", zip_code:"44000", city:"NANTES",latitude: 47.2123489, longitude: -1.5556282, phone: "02 40 47 01 69", time_slot: "12", picture: File.new(Rails.root.join("db/fixtures/images/restaurants/le-cote-plage.jpg")),password:"123456", password_confirmation:"123456",email: "le-cote-plage@gmail.com")
legressin = Restaurant.create!(name:"LE GRESSIN", address:"40 bis Rue Fouré", zip_code:"44000", city:"NANTES",latitude: 47.2115768, longitude: -1.5469241, phone: "02 40 48 26 24", time_slot: "12", picture: File.new(Rails.root.join("db/fixtures/images/restaurants/le-gressin.jpg")),password:"123456", password_confirmation:"123456",email: "le-gressin@gmail.com")
lepetitquiafait = Restaurant.create!(name:"LE P'TIT QU'A FAIT", address:"11 rue des olivettes ", zip_code:"44000", city:"NANTES",latitude: 47.2120526, longitude: -1.5499659, phone: "09 52 67 31 26", time_slot: "12", picture: File.new(Rails.root.join("db/fixtures/images/restaurants/le-petit-qua-fait.jpg")),password:"123456", password_confirmation:"123456",email: "le-petit-qua-fait@gmail.com")
maisonbaron = Restaurant.create!(name:"MAISON BARON-LEFÈVRE", address:"33 Rue de Rieux", zip_code:"44000", city:"NANTES",latitude: 47.2104248, longitude: -1.545918, phone: "2 40 89 20 20", time_slot: "12", picture: File.new(Rails.root.join("db/fixtures/images/restaurants/maison-baron.jpg")),password:"123456", password_confirmation:"123456",email: "maison-baron@gmail.com")
planb = Restaurant.create!(name:"PLAN B", address:"29 rue Fouré ", zip_code:"44000", city:"NANTES",latitude: 47.2117423, longitude: -1.5467001, phone: "02 85 37 15 02", time_slot: "12", picture: File.new(Rails.root.join("db/fixtures/images/restaurants/plan-b.jpg")),password:"123456", password_confirmation:"123456",email: "plan-b@gmail.com")
tapas = Restaurant.create!(name:"TAPAS ET VINOS", address:"15 rue Kervegan", zip_code:"44000", city:"NANTES",latitude: 47.2126533, longitude: -1.5557163, phone: "02 40 20 86 91", time_slot: "12", picture: File.new(Rails.root.join("db/fixtures/images/restaurants/tapas-et-vinos.jpg")),password:"123456", password_confirmation:"123456",email: "tapas-et-vinos@gmail.com")
totum = Restaurant.create!(name:"TOTUM - CANTINE BIO", address:"carré feydeau", zip_code:"44000", city:"NANTES",latitude: 47.2122884, longitude: -1.556059, phone: "02 40 55 55 55", time_slot: "12", picture: File.new(Rails.root.join("db/fixtures/images/restaurants/totum.jpg")),password:"123456", password_confirmation:"123456",email: "totum@gmail.com")
ylang = Restaurant.create!(name:"YLANG YLANG", address:"40 rue Fouré", zip_code:"44000", city:"NANTES",latitude: 47.2115812, longitude: -1.546914, phone: "02 51 83 13 31", time_slot: "12", picture: File.new(Rails.root.join("db/fixtures/images/restaurants/ylang.jpg")),password:"123456", password_confirmation:"123456",email: "ylang@gmail.com")

puts "Creating meals for friday"

cantina_spaghettis_bolognaise = Meal.create!(
  restaurant: cantina,
  category: Category.find_by_name!("Italien"),
  name: "Spaghetti bolognaise",
  description: "Spaghettis, viande haché, carottes, coulis de tomate, céleri, ail, huile d'olive",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/cantina_spaghettis_bolognaise.jpg"))
)

cantina.update!(
  friday_meal: cantina_spaghettis_bolognaise, friday_meal_count: 10
)

rafael_couscous = Meal.create!(
  restaurant: rafael,
  category: Category.find_by_name!("Méditerranéen"),
  name: "Couscous",
  description: "Morceau d'agneau, 1 merguez , semoule, navets, courgettes.",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/rafael_couscous.jpg"))
)

rafael.update!(
  friday_meal: rafael_couscous, friday_meal_count: 10
)

raffinerie_crevettes_sichuan = Meal.create!(
  restaurant: raffinerie,
  category: Category.find_by_name!("Asiatique"),
  name: "Crevettes Sichuan",
  description: "Crevettes, pois gourmands, carottes, poivrons, ail",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/raffinerie_crevettes_sichuan.jpg"))
)

raffinerie.update!(
  friday_meal: raffinerie_crevettes_sichuan, friday_meal_count: 10
)

alain_pave_de_saumon = Meal.create!(
  restaurant: alain,
  category: Category.find_by_name!("Méditerranéen"),
  name: "Pavé de Saumon",
  description: "1 pavé de saumon, tomates, salade",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/alain_pave_de_saumon.jpg"))
)

alain.update!(
  friday_meal: alain_pave_de_saumon, friday_meal_count: 10
)

coteplage_quiche_lorraine = Meal.create!(
  restaurant: coteplage,
  category: Category.find_by_name!("Latin"),
  name: "Quiche lorraine",
  description: "Pâte brisée, lardons fumés, dès jambon blanc, gruyère rapé, oeuf",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/coteplage_quiche_lorraine.jpg"))
)

coteplage.update!(
  friday_meal: coteplage_quiche_lorraine, friday_meal_count: 10
)

legressin_lasagne = Meal.create!(
  restaurant: legressin,
  category: Category.find_by_name!("Italien"),
  name: "Lasagne Bio",
  description: "pâte à lasagne, viande haché, chair a saucisse, purée de tomates",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/legressin_lasagne.jpg"))
)

legressin.update!(
  friday_meal: legressin_lasagne, friday_meal_count: 10
)

lepetitquiafait_hachis_parmentier = Meal.create!(
  restaurant: lepetitquiafait,
  category: Category.find_by_name!("Latin"),
  name: "hachis parmentier",
  description: "Pommes de terre, viande haché, oignons, persil, oeuf",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/lepetitquiafait_hachis_parmentier.jpg"))
)

lepetitquiafait.update!(
  friday_meal: lepetitquiafait_hachis_parmentier, friday_meal_count: 10
)


maisonbaron_andouillette_pommes_de_terre = Meal.create!(
  restaurant: maisonbaron,
  category: Category.find_by_name!("Latin"),
  name: "Andouillette royale",
  description: "Andouillette, pommes de terre, fromage rapé, moutarde",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/maisonbaron_andouillette_pommes_de_terre.jpg"))
)

maisonbaron.update!(
  friday_meal: maisonbaron_andouillette_pommes_de_terre, friday_meal_count: 10
)


planb_salade_saumon_tomates = Meal.create!(
  restaurant: planb,
  category: Category.find_by_name!("Méditerranéen"),
  name: "Salade au Saumon et tomates ",
  description: "Saumon bio, salade, tomates, vinaigrette",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/planb_salade_saumon_tomates.jpg"))
)

planb.update!(
  friday_meal: planb_salade_saumon_tomates, friday_meal_count: 10
)

totum_buddha_bowl = Meal.create!(
  restaurant: totum,
  category: Category.find_by_name!("Végétarien"),
  name: "Buddha bowl",
  description: "Tofu, pois, brocoli, riz, salade, curry",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/totum_buddha_bowl.jpg"))
)

totum.update!(
  friday_meal: totum_buddha_bowl, friday_meal_count: 10
)
tapas_burger = Meal.create!(
  restaurant: tapas,
  category: Category.find_by_name!("Américain"),
  name: "Burger frites",
  description: "poisson pané, pain burger, frites, sauce blanche",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/tapas_burger.jpg"))
)
tapas.update!(
  friday_meal: tapas_burger, friday_meal_count: 10
)
ylang_chicken_pad = Meal.create!(
  restaurant: ylang,
  category: Category.find_by_name!("Asiatique"),
  name: "Chicken pad",
  description: "Nouille de riz plat, poulet, haricot frais, oignons, sauce pimentée",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/ylang_chicken_pad.jpg"))
)

ylang.update!(
  friday_meal: ylang_chicken_pad, friday_meal_count: 10
)



puts "Creating restaurants and their meals..."

lecomptoir = Restaurant.create!(
  name: "Le Comptoir", email: "contact@lecomptoir.com", time_slot: "12",
  address: "21 rue Fouré", zip_code: "44000", city: "Nantes",
  password: "123456", password_confirmation: "123456",
  picture: File.new(Rails.root.join("db/fixtures/images/restaurants/le_comptoir.jpg")),
  latitude: 47.211948,
  longitude: -1.546676
)

lecomptoir_couscous = Meal.create!(
  restaurant: lecomptoir,
  category: Category.find_by_name!("Méditerranéen"),
  name: "Couscous",
  description: "Couscous royal simple avec 1 morceaux d'agneau, 1 merguez , navets, courgettes.",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/lecomptoir_couscous.jpg"))
)

lecomptoir_crevettes_sichuan = Meal.create!(
  restaurant: lecomptoir,
  category: Category.find_by_name!("Asiatique"),
  name: "Crevettes Sichuan",
  description: "",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/lecomptoir_crevettes_sichuan.JPG"))
)

lecomptoir_pave_de_saumon = Meal.create!(
  restaurant: lecomptoir,
  category: Category.find_by_name!("Latin"),
  name: "Pavé de Saumon",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/lecomptoir_pave_de_saumon.jpg"))
)

lecomptoir.update!(
  monday_meal: lecomptoir_pave_de_saumon, monday_meal_count: 2,
  tuesday_meal: lecomptoir_crevettes_sichuan, tuesday_meal_count: 10,
  wednesday_meal: lecomptoir_pave_de_saumon, wednesday_meal_count: 15,
  thursday_meal: lecomptoir_couscous, thursday_meal_count: 10,
  friday_meal: lecomptoir_pave_de_saumon, friday_meal_count: 0
)

##################################################

la500 = Restaurant.create!(
  name: "La 500", email: "contact@la500.com", time_slot: "12",
  address: "1 rue Santeuil", zip_code: "44000", city: "Nantes",
  password: "123456", password_confirmation: "123456",
  picture: File.new(Rails.root.join("db/fixtures/images/restaurants/la_500.jpg"))
)

la500_quiche_lorraine = Meal.create!(
  restaurant: la500,
  category: Category.find_by_name!("Latin"),
  name: "Quiche Lorraine",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/la500_quiche_lorraine.jpg"))
)

la500_lasagne = Meal.create!(
  restaurant: la500,
  category: Category.find_by_name!("Italien"),
  name: "Lasagne",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/la500_lasagne.jpg"))
)

la500_spaghettis_bolognaise = Meal.create!(
  restaurant: la500,
  category: Category.find_by_name!("Italien"),
  name: "Spaghettis bolognaise ",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/la500_spaghettis_bolognaise.jpg"))
)

la500.update!(
  monday_meal: la500_spaghettis_bolognaise, monday_meal_count: 10,
  tuesday_meal: la500_lasagne, tuesday_meal_count: 10,
  wednesday_meal: la500_quiche_lorraine, wednesday_meal_count: 12,
  thursday_meal: la500_spaghettis_bolognaise, thursday_meal_count: 10,
  friday_meal: la500_lasagne, friday_meal_count: 0
)


##################################################

lecoufourre = Restaurant.create!(
  name: "Le Cou Fourré", email: "contact@lecoufourre.com", time_slot: "12",
  address: "30 rue de Fouré", zip_code: "44000", city: "Nantes",
  password: "123456", password_confirmation: "123456",
  picture: File.new(Rails.root.join("db/fixtures/images/restaurants/le_cou_fourre.jpg"))
)

lecoufourre_hachis_parmentier = Meal.create!(
  restaurant: lecoufourre,
  category: Category.find_by_name!("Latin"),
  name: "Hachis parmentier",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/lecoufourre_hachis_parmentier.jpg"))
)

lecoufourre_andouillette_pommes_de_terre = Meal.create!(
  restaurant: lecoufourre,
  category: Category.find_by_name!("Latin"),
  name: "Andouillette Pommes de terre",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/lecoufourre_andouillette_pommes_de_terre.jpg"))
)

lecoufourre_salade_saumon_tomates = Meal.create!(
  restaurant: lecoufourre,
  category: Category.find_by_name!("Méditerranéen"),
  name: "Salade au Saumon et tomates ",
  picture: File.new(Rails.root.join("db/fixtures/images/meals/lecoufourre_salade_saumon_tomates.jpg"))
)

lecoufourre.update!(
  monday_meal: lecoufourre_hachis_parmentier, monday_meal_count: 20,
  tuesday_meal: lecoufourre_hachis_parmentier, tuesday_meal_count: 10,
  wednesday_meal: lecoufourre_salade_saumon_tomates, wednesday_meal_count: 20,
  thursday_meal: lecoufourre_andouillette_pommes_de_terre, thursday_meal_count: 15,
  friday_meal: lecoufourre_salade_saumon_tomates, friday_meal_count: 0
)

##################################################

puts "Finished"
