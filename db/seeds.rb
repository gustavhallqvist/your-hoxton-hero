# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

puts 'Clearing database'

BookingReview.destroy_all
TaskReview.destroy_all
Booking.destroy_all
Task.destroy_all
User.destroy_all
Category.destroy_all

Categories = ['Errand', 'Shopping', 'Driving', 'Cooking', 'Cleaning', 'Gardening', 'Babysitting', 'Dog Walking', 'Companion']

puts 'Creating Categories'

Categories.each do |category|
  Category.create(name: category)
end

puts "Succesfully created #{Category.count} Categories"

puts 'Creating Admin'

User.create(email: 'admin@yourhoxtonhero.com', password: 'yourhoxtonhero', name: 'site administrator', admin: true)

puts 'Creating Users'

User.create(email: 'kirsti@gmail.com', password: 'yourhoxtonhero', name: 'Bob', surname: 'Wallace' , address: 'Fulham, London', contact_number: '07775127846', date_of_birth: Date.parse("10/10/1954"), bio: 'Single man living along in Fulham', disability: 'None',   admin: false)
User.create(email: 'tony@gmail.com', password: 'yourhoxtonhero', name: 'Sarah', surname: 'Mayles', address: 'Hoxton, London', contact_number: '07775127566', date_of_birth: Date.parse("04/09/1979"), bio: 'Single mother with 3 kids and a full-time job', disability: 'None',   admin: false)
User.create(email: 'gustav@gmail.com', password: 'yourhoxtonhero', name: 'Will', surname: 'Hill' , address: 'Shoreditch, London', contact_number: '07773327846', date_of_birth: Date.parse("22/04/1982"), bio: 'Suffering with Cerebral Palsy' , disability: 'Cerebral Palsy',   admin: false)
User.create(email: 'genti@yahoo.com', password: 'yourhoxtonhero', name: 'Lucy', surname: 'Silver', address: 'Clapham, London' , contact_number: '07775127849', date_of_birth: Date.parse("15/02/1951"), bio: 'Widow living alone in Clapham', disability: 'None',   admin: false)
User.create(email: 'mike@yahoo.com', password: 'yourhoxtonhero', name: 'Mike', surname: 'Myers', address: 'Bermondsey, Lonon', contact_number: '07775127812', date_of_birth: Date.parse("25/11/1946"), bio: 'Old man living alone in Bermondsey', disability: 'Wheelchair' ,   admin: false)
User.create(email: 'luke@gmail.com', password: 'yourhoxtonhero', name: 'Luke', surname: 'Tate' , address: 'Fulham, London', contact_number: '07775127877', date_of_birth: Date.parse("11/05/1993"), bio: 'Looking to help people in need', disability: 'None',   admin: false)
User.create(email: 'mary@gmail.com', password: 'yourhoxtonhero', name: 'Mary', surname: 'Magdalene', address: 'Hoxton, London', contact_number: '07775127592', date_of_birth: Date.parse("18/06/1988"), bio: 'Looking to give back to my local community', disability: 'None',   admin: false)
User.create(email: 'john@gmail.com', password: 'yourhoxtonhero', name: 'John', surname: 'Peters' , address: 'Shoreditch, London', contact_number: '07773327521', date_of_birth: Date.parse("19/01/1985"), bio: 'Want to help others' , disability: 'None',   admin: false)
User.create(email: 'louisa@yahoo.com', password: 'yourhoxtonhero', name: 'Louisa', surname: 'Peers', address: 'Clapham, London' , contact_number: '07775127989', date_of_birth: Date.parse("12/12/1995"), bio: 'Happy to help anyone with anything', disability: 'None',   admin: false)
User.create(email: 'ollie@yahoo.com', password: 'yourhoxtonhero', name: 'Ollie', surname: 'Xu', address: 'Bermondsey, Lonon', contact_number: '07775127378', date_of_birth: Date.parse("30/06/1981"), bio: 'Love helping others in my spare time', disability: 'None' ,   admin: false)

puts "Succesfully created #{User.count} Users"

puts 'Creating chatroom'
Chatroom.create(name: "Hero chat")
puts 'Created chatroom'

puts 'Creating Tasks'

Task.create(user_id: 2, category_id: 3, description: 'Need someone to drive me to a doctors appointment', date: DateTime.parse('12th Mar 2020 15:00:00+00:00'), address: 'Fulham, London')
Task.create(user_id: 3, category_id: 7, description: 'Need someone to pick up my kids from school today', date: DateTime.parse('14th Mar 2020 17:00:00+00:00'), address: 'Brixton, London')
Task.create(user_id: 4, category_id: 4, description: 'Need someone to cook and feed me dinner', date: DateTime.parse('13th Mar 2020 19:00:00+00:00'), address: 'Shoreditch, London')
Task.create(user_id: 5, category_id: 1, description: 'Need someone to help me with my computer', date: DateTime.parse('13th Mar 2020 12:00:00+00:00'), address: 'Clapham, London')
Task.create(user_id: 6, category_id: 9, description: 'Will someone please take me out for some fresh air', date: DateTime.parse('6th Mar 2020 16:00:00+00:00'), address: 'Bermondsey, London')
Task.create(user_id: 7, category_id: 4, description: 'Need someone to cook and feed me dinner', date: DateTime.parse('15th Mar 2020 19:00:00+00:00'), address: 'Shoreditch, London')
Task.create(user_id: 8, category_id: 7, description: 'Need someone to pick up my kids from school today', date: DateTime.parse('16th Mar 2020 17:00:00+00:00'), address: 'Brixton, London')
Task.create(user_id: 9, category_id: 4, description: 'Need someone to cook and feed me dinner', date: DateTime.parse('12th Mar 2020 19:00:00+00:00'), address: 'Shoreditch, London')

puts "Succesfully created #{Task.count} Tasks"

puts 'Creating Bookings'

Booking.create(user_id: 7, task_id: 1, status: false)
Booking.create(user_id: 8, task_id: 2, status: false)
Booking.create(user_id: 9, task_id: 3, status: false)
Booking.create(user_id: 10, task_id: 4, status: false)
Booking.create(user_id: 11, task_id: 5, status: false)
Booking.create(user_id: 8, task_id: 4, status: false)
Booking.create(user_id: 10, task_id: 1, status: false)
Booking.create(user_id: 9, task_id: 6, status: false)
Booking.create(user_id: 11, task_id: 7, status: false)
Booking.create(user_id: 7, task_id: 8, status: false)
Booking.create(user_id: 10, task_id: 6, status: false)

puts "Succesfully created #{Booking.count} Bookings"
