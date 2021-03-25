# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

puts 'Clearing database'

Message.destroy_all
BookingReview.destroy_all
TaskReview.destroy_all
Booking.destroy_all
Task.destroy_all
User.destroy_all
Category.destroy_all


Categories = [['Errand', "errand_icon.png"], ['Shopping',"shopping_icon.png"], ['Driving', "driving_icon.png"], ['Cooking', "cooking_icon.png"], ['Cleaning',"washing_icon.png"], ['Gardening',"gardening_icon.png"], ['Babysitting',"babysitting_icon.png"], ['Dog Walking', "dog_walk_icon.png"], ['Companion', "coffee_icon.png"]]

puts 'Creating Categories'

Categories.each do |category|
  Category.create!(name: category[0], icon: category[1])
end

puts "Succesfully created #{Category.count} Categories"

puts 'Creating Admin'

User.create(email: 'admin@yourhoxtonhero.com', password: 'yourhoxtonhero', name: 'site administrator', admin: true)

puts 'Creating Users'

user = User.new(email: 'bob@gmail.com', password: 'yourhoxtonhero', name: 'Bob', surname: 'Wallace' , address: 'Fulham, London', contact_number: '07775127846', date_of_birth: Date.parse("10/10/1954"), bio: 'Single man living along in Fulham', disability: 'None',   admin: false)
user.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'senior_1.jpg')), filename: 'senior_1.jpg')
  user.save

user = User.new(email: 'sarah@gmail.com', password: 'yourhoxtonhero', name: 'Sarah', surname: 'Mayles', address: 'Hoxton, London', contact_number: '07775127566', date_of_birth: Date.parse("04/09/1979"), bio: 'Single mother with 3 kids and a full-time job', disability: 'None',   admin: false)
user.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'old_lady_1.jpg')), filename: 'ld_lady_1.jpg')
  user.save

user = User.new(email: 'will@gmail.com', password: 'yourhoxtonhero', name: 'Will', surname: 'Hill' , address: 'Shoreditch, London', contact_number: '07773327846', date_of_birth: Date.parse("22/04/1982"), bio: 'Suffering with Cerebral Palsy' , disability: 'Cerebral Palsy',   admin: false)
user.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'senior_2.jpg')), filename: 'senior_2.jpg')
 user.save

user = User.new(email: 'lucy@yahoo.com', password: 'yourhoxtonhero', name: 'Lucy', surname: 'Silver', address: 'Clapham, London' , contact_number: '07775127849', date_of_birth: Date.parse("15/02/1951"), bio: 'Widow living alone in Clapham', disability: 'None',   admin: false)
user.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'old_lady_2.jpg')), filename: 'old_lady_2.jpg')
 user.save

user = User.new(email: 'mike@yahoo.com', password: 'yourhoxtonhero', name: 'Mike', surname: 'Myers', address: 'Bermondsey, Lonon', contact_number: '07775127812', date_of_birth: Date.parse("25/11/1946"), bio: 'Old man living alone in Bermondsey', disability: 'Wheelchair' ,   admin: false)
user.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'senior_3.jpg')), filename: 'senior_3.jpg')
 user.save

user = User.new(email: 'luke@gmail.com', password: 'yourhoxtonhero', name: 'Luke', surname: 'Tate' , address: 'Fulham, London', contact_number: '07775127877', date_of_birth: Date.parse("11/05/1993"), bio: 'Looking to help people in need', disability: 'None',   admin: false)
user.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'senior_4.jpg')), filename: 'senior_4.jpg')
user.save

user = User.new(email: 'mary@gmail.com', password: 'yourhoxtonhero', name: 'Mary', surname: 'Magdalene', address: 'Hoxton, London', contact_number: '07775127592', date_of_birth: Date.parse("18/06/1988"), bio: 'Looking to give back to my local community', disability: 'None',   admin: false)
user.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'old_lady_3.jpg')), filename: 'old_lady_3.jpg')
user.save

user = User.new(email: 'louisa@yahoo.com', password: 'yourhoxtonhero', name: 'Louisa', surname: 'Peers', address: 'Clapham, London' , contact_number: '07775127989', date_of_birth: Date.parse("12/12/1995"), bio: 'Happy to help anyone with anything', disability: 'None',   admin: false)
user.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'old_lady_4.jpg')), filename: 'old_lady_4.jpg')
user.save

user = User.new(email: 'ollie@yahoo.com', password: 'yourhoxtonhero', name: 'Ollie', surname: 'Xu', address: 'Bermondsey, Lonon', contact_number: '07775127378', date_of_birth: Date.parse("30/06/1981"), bio: 'Love helping others in my spare time', disability: 'None' ,   admin: false)
user.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'senior_5.jpg')), filename: 'senior_5.jpg')
user.save


puts "Succesfully created #{User.count} Users"

puts 'Creating Tasks'
Task.create(user_id: 2, category_id: 3, description: 'Need someone to drive me to a doctors appointment', date: DateTime.parse('20th Mar 2021 15:00:00+00:00'), address: 'Fulham, London')
Task.create(user_id: 3, category_id: 7, description: 'Need someone to pick up my kids from school today', date: DateTime.parse('20th Mar 2021 17:00:00+00:00'), address: 'Brixton, London')
Task.create(user_id: 4, category_id: 4, description: 'Need someone to cook and feed me dinner', date: DateTime.parse('21st Mar 2021 19:00:00+00:00'), address: 'Shoreditch, London')
Task.create(user_id: 5, category_id: 1, description: 'Need someone to help me with my computer', date: DateTime.parse('22nd Mar 2021 12:00:00+00:00'), address: 'Clapham, London')
Task.create(user_id: 6, category_id: 9, description: 'Will someone please take me out for some fresh air', date: DateTime.parse('21st Mar 2021 16:00:00+00:00'), address: 'Bermondsey, London')
Task.create(user_id: 4, category_id: 4, description: 'Need someone to cook and feed me dinner', date: DateTime.parse('20th Mar 2021 19:00:00+00:00'), address: 'Shoreditch, London')
Task.create(user_id: 3, category_id: 7, description: 'Need someone to pick up my kids from school today', date: DateTime.parse('23rd Mar 2021 17:00:00+00:00'), address: 'Brixton, London')
Task.create(user_id: 4, category_id: 4, description: 'Need someone to cook and feed me dinner', date: DateTime.parse('23rd Mar 2021 19:00:00+00:00'), address: 'Shoreditch, London')
Task.create(user_id: 2, category_id: 3, description: 'Need someone to drive me to a doctors appointment', date: DateTime.parse('27th Mar 2021 15:00:00+00:00'), address: 'Fulham, London')
Task.create(user_id: 3, category_id: 7, description: 'Need someone to pick up my kids from school today', date: DateTime.parse('27th Mar 2021 17:00:00+00:00'), address: 'Brixton, London')
Task.create(user_id: 4, category_id: 4, description: 'Need someone to cook and feed me dinner', date: DateTime.parse('28th Mar 2021 19:00:00+00:00'), address: 'Shoreditch, London')
Task.create(user_id: 5, category_id: 1, description: 'Need someone to help me with my computer', date: DateTime.parse('29th Mar 2021 12:00:00+00:00'), address: 'Clapham, London')
Task.create(user_id: 6, category_id: 9, description: 'Will someone please take me out for some fresh air', date: DateTime.parse('28th Mar 2021 16:00:00+00:00'), address: 'Bermondsey, London')
Task.create(user_id: 4, category_id: 4, description: 'Need someone to cook and feed me dinner', date: DateTime.parse('27th Mar 2021 19:00:00+00:00'), address: 'Shoreditch, London')
Task.create(user_id: 3, category_id: 7, description: 'Need someone to pick up my kids from school today', date: DateTime.parse('30th Mar 2021 17:00:00+00:00'), address: 'Brixton, London')
Task.create(user_id: 4, category_id: 4, description: 'Need someone to cook and feed me dinner', date: DateTime.parse('30th Mar 2021 19:00:00+00:00'), address: 'Shoreditch, London')

puts "Succesfully created #{Task.count} Tasks"

puts 'Creating Bookings'

Booking.create(user_id: 7, task_id: 1, status: false)
Booking.create(user_id: 8, task_id: 2, status: true)
Booking.create(user_id: 9, task_id: 3, status: true)
Booking.create(user_id: 10, task_id: 4, status: false)
Booking.create(user_id: 11, task_id: 5, status: true)
Booking.create(user_id: 8, task_id: 4, status: true)
Booking.create(user_id: 10, task_id: 1, status: true)
Booking.create(user_id: 9, task_id: 6, status: false)
Booking.create(user_id: 11, task_id: 7, status: true)
Booking.create(user_id: 7, task_id: 8, status: true)
Booking.create(user_id: 10, task_id: 6, status: true)
Booking.create(user_id: 7, task_id: 9, status: false)
Booking.create(user_id: 8, task_id: 10, status: false)
Booking.create(user_id: 9, task_id: 11, status: false)
Booking.create(user_id: 10, task_id: 12, status: false)
Booking.create(user_id: 11, task_id: 13, status: false)
Booking.create(user_id: 8, task_id: 12, status: false)
Booking.create(user_id: 10, task_id: 9, status: false)
Booking.create(user_id: 9, task_id: 14, status: false)
Booking.create(user_id: 11, task_id: 15, status: false)
Booking.create(user_id: 7, task_id: 16, status: false)
Booking.create(user_id: 10, task_id: 14, status: false)

puts "Succesfully created #{Booking.count} Bookings"

puts 'Creating Task Reviews'

TaskReview.create(user_id: 10, task_id: 1, rating: 4, comment: "No problems!")
TaskReview.create(user_id: 8, task_id: 2, rating: 5, comment: "The kids were absolute angels")
TaskReview.create(user_id: 9, task_id: 3, rating: 3, comment: "Fussy eater")
TaskReview.create(user_id: 8, task_id: 4, rating: 2, comment: "Should be reaching out to an engineer for these requests")
TaskReview.create(user_id: 11, task_id: 5, rating: 5, comment: "Super friendly!")
TaskReview.create(user_id: 10, task_id: 6, rating: 4, comment: "Lovely man!")
TaskReview.create(user_id: 11, task_id: 7, rating: 2, comment: "Kids were very naughty")
TaskReview.create(user_id: 7, task_id: 8, rating: 5, comment: "He's a sweetheart")

puts "Succesfully created #{TaskReview.count} Task Reviews"

puts 'Creating Booking Reviews'

BookingReview.create(user_id: 3, booking_id: 2, rating: 3, comment: "Did a good job" )
BookingReview.create(user_id: 4, booking_id: 3, rating: 5, comment: "What would I do without you?")
BookingReview.create(user_id: 6, booking_id: 5, rating: 4, comment: "Very helpful!")
BookingReview.create(user_id: 5, booking_id: 6, rating: 2, comment: "Not very friendly")
BookingReview.create(user_id: 2, booking_id: 7, rating: 5, comment: "An angel!")
BookingReview.create(user_id: 3, booking_id: 9, rating: 4, comment: "Very nice person")
BookingReview.create(user_id: 4, booking_id: 10, rating: 3, comment: "Ok")
BookingReview.create(user_id: 4, booking_id: 11, rating: 4, comment: "Thank you!")

puts "Succesfully created #{BookingReview.count} Booking Reviews"

puts 'Creating chatroom'
Chatroom.create(name: "Hero chat")
puts 'Created chatroom'

