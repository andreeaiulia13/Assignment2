require_relative  '../models/model.rb'
require_relative '../controllers/controller.rb'

puts ''
puts "        WELCOME TO OUR CAR CLEANING SERVICE!"
puts '       Caring for your vehicle is our business'
puts '              Clean cars run better'

option = 0

while(option != 7)

  puts ''
  puts 'How can we help you?'
  puts '1. I want my car to be cleaned now'
  puts '2. I want to make an appointment'
  puts '3. I want to check my car cleaning status'
  puts '4. I want to check the car cleaning service schedule'
  puts '5. I want to check the car cleaning service appointments'
  puts '6. I want to pick up my car'
  puts '7. Exit'
  puts ''
  
  option = gets.chomp

  case option
  when '1'
    add_appointment_now

  when '2'
    make_new_appointment

  when '3' 
    check_car_status

  when '4'
    show_schedule

  when '6'
    pick_up_car

  when '5'
    show_appointments

  when '7'
    puts 'Thank you for choosing our car cleaning service.'
    puts "We are waiting for you to come back, don't forget: A clean car is a happy car"
    puts 'Have a good one!'
    break

  else
    puts 'Please enter a number from 1-7 (1, 2, 3, 4, 5, 6,7)'
  end
end
