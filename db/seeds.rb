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
Subscription.create!(price: 150, meals_count: 12, name: "12 repas", description: "Vous donne droit à 12 repas au cours du mois")
Subscription.create!(price: 250, meals_count: 20, name: "20 repas", description: "Vous donne droit à 20 repas au cours du mois")

puts "Creating categories..."
["Pizza", "Asiatique", "Indien", "Français"].each do |name|
  Category.create!(name: name)
end

##################################################
##################################################

puts "Creating users..."
thomas = User.create!(first_name: "Thomas", last_name: "Commercial", email: "thomas@gmail.com", password: "123456", password_confirmation: "123456", address: "32 rue Fouré", zip_code: "44000", city: "Nantes", phone_number: "064523456543", time_slot: "12")
# TODO: User food preferences

##################################################

puts "Creating restaurants and their meals..."

lecomptoir = Restaurant.create!(
  name: "Le Comptoir", email: "contact@lecomptoir.com", time_slot: "12",
  address: "31 rue Fouré", zip_code: "44000", city: "Nantes",
  password: "123456", password_confirmation: "123456"
)

lecomptoir_pizza_pepe = Meal.create!(
  restaurant: lecomptoir,
  category: Category.find_by_name!("Pizza"),
  name: "Pizza Pepe"
)

lecomptoir_pizza_stagioni = Meal.create!(
  restaurant: lecomptoir,
  category: Category.find_by_name!("Pizza"),
  name: "Pizza 4 stagioni"
)

lecomptoir_pizza_formagi = Meal.create!(
  restaurant: lecomptoir,
  category: Category.find_by_name!("Pizza"),
  name: "Pizza 4 formagi"
)

lecomptoir.update!(
  monday_meal: lecomptoir_pizza_formagi, monday_meal_count: 2,
  tuesday_meal: lecomptoir_pizza_stagioni, tuesday_meal_count: 10,
  wednesday_meal: lecomptoir_pizza_pepe, wednesday_meal_count: 15,
  thursday_meal: lecomptoir_pizza_stagioni, thursday_meal_count: 10,
  friday_meal: lecomptoir_pizza_formagi, friday_meal_count: 2
)

##################################################

avecousandwich = Restaurant.create!(
  name: "Le Comptoir", email: "contact@lecomptoir.com", time_slot: "12",
  address: "31 rue Fouré", zip_code: "44000", city: "Nantes",
  password: "123456", password_confirmation: "123456"
)

##################################################

puts "Finished"
