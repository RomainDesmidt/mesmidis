puts "Cleaning database..."
Order.destroy_all
Meal.destroy_all
Restaurant.destroy_all
User.destroy_all
Category.destroy_all
Subscription.destroy_all

##################################################

## Static data

puts "Creating subscriptions..."
Subscription.create!(price: 79, meals_count: 12, name: "12 repas", description: "Vous donne droit à 12 repas au cours du mois")
Subscription.create!(price: 119, meals_count: 20, name: "20 repas", description: "Vous donne droit à 20 repas au cours du mois")

puts "Creating categories..."
["Italien", "Marocain", "Asiatique", "Français"].each do |name|
  Category.create!(name: name)
end

##################################################
##################################################

puts "Creating users..."
thomas = User.create!(first_name: "Thomas", last_name: "Commercial", email: "thomas@gmail.com", password: "123456", password_confirmation: "123456", address: "32 rue Fouré", zip_code: "44000", city: "Nantes", phone_number: "0645234565", time_slot: "12")

karim = User.create!(first_name: "Karim", last_name: "Garcia", email: "karim_garcia@gmail.com", password: "654321", password_confirmation: "654321", address: "32 rue du Chateau", zip_code: "44000", city: "Nantes", phone_number: "0610203040", time_slot: "13")

cecile = User.create!(first_name: "Cecile", last_name: "Veneziani", email: "cecile@gmail.com", password: "135790", password_confirmation: "135790", address: "10 rue des Fleurs", zip_code: "44200", city: "Nantes", phone_number: "0615202530", time_slot: "12")

# TODO: User food preferences



##################################################

puts "Creating restaurants and their meals..."

lecomptoir = Restaurant.create!(
  name: "Le Comptoir", email: "contact@lecomptoir.com", time_slot: "12",
  address: "31 rue Fouré", zip_code: "44000", city: "Nantes",
  password: "123456", password_confirmation: "123456"
)

lecomptoir_couscous = Meal.create!(
  restaurant: lecomptoir,
  category: Category.find_by_name!("Marocain"),
  name: "Couscous"
)

lecomptoir_crevettes_sichuan = Meal.create!(
  restaurant: lecomptoir,
  category: Category.find_by_name!("Asiatique"),
  name: "Crevettes Sichuan"
)

lecomptoir_pave_de_saumon = Meal.create!(
  restaurant: lecomptoir,
  category: Category.find_by_name!("Français"),
  name: "Pavé de Saumon"
)

lecomptoir.update!(
  monday_meal: lecomptoir_pave_de_saumon, monday_meal_count: 2,
  tuesday_meal: lecomptoir_crevettes_sichuan, tuesday_meal_count: 10,
  wednesday_meal: lecomptoir_pave_de_saumon, wednesday_meal_count: 15,
  thursday_meal: lecomptoir_couscous, thursday_meal_count: 10,
  friday_meal: lecomptoir_pave_de_saumon, friday_meal_count: 2
)

##################################################

leplanb = Restaurant.create!(
  name: "Le plan B", email: "contact@leplanb.com", time_slot: "12",
  address: "28 rue Fouré", zip_code: "44000", city: "Nantes",
  password: "123456", password_confirmation: "123456"
)

leplanb_quiche_lorraine = Meal.create!(
  restaurant: leplanb,
  category: Category.find_by_name!("Français"),
  name: "Quiche Lorraine"
)

leplanb_lasagne = Meal.create!(
  restaurant: leplanb,
  category: Category.find_by_name!("Italien"),
  name: "Lasagne"
)

leplanb_spaghettis_bolognaise = Meal.create!(
  restaurant: leplanb,
  category: Category.find_by_name!("Italien"),
  name: "Spaghettis bolognaise "
)

leplanb.update!(
  monday_meal: leplanb_Spaghettis_bolognaise, monday_meal_count: 10,
  tuesday_meal: leplanb_lasagne, tuesday_meal_count: 10,
  wednesday_meal: leplanb_quiche_lorraine, wednesday_meal_count: 12,
  thursday_meal: leplanb_Spaghettis_bolognaise, thursday_meal_count: 10,
  friday_meal: leplanb_lasagne, friday_meal_count: 8


##################################################

lestontons = Restaurant.create!(
  name: "Les Tontons", email: "contact@lestontons.com", time_slot: "12",
  address: "10 rue de l'église", zip_code: "44100", city: "Nantes",
  password: "123456", password_confirmation: "123456"
)

lestontons_hachis_parmentier = Meal.create!(
  restaurant: lestontons,
  category: Category.find_by_name!("Français"),
  name: "Hachis parmentier"
)

lestontons_andouillette_pommes_de_terre = Meal.create!(
  restaurant: lestontons,
  category: Category.find_by_name!("Français"),
  name: "Andouillette Pommes de terre"
)

lestontons_salade_saumon_tomates = Meal.create!(
  restaurant: lestontons,
  category: Category.find_by_name!("Français"),
  name: "Salade au Saumon et tomates "
)

lestontons_Spaghettis_bolognaise.update!(
  monday_meal: lestontons_hachis_parmentier, monday_meal_count: 20,
  tuesday_meal: lestontons_hachis_parmentier, tuesday_meal_count: 10,
  wednesday_meal: lestontons_salade_saumon_tomates, wednesday_meal_count: 20,
  thursday_meal: lestontons_andouillette_pommes_de_terre, thursday_meal_count: 15,
  friday_meal: lestontons_salade_saumon_tomates, friday_meal_count: 8


##################################################

puts "Finished"
