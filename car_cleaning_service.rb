class Car
  attr_reader :user_name
  attr_reader :drop_time
  attr_accessor :pickup_time

  @@cars = Array.new

  def self.all
    @@cars
  end

  def initialize(user_name, time)
    @user_name = user_name
    @drop_time = time
    @pickup_time = (time + 7200)
    @@cars << self
  end
end

cars= Car.new("Ana Filip", Time.new(2021, 04, 19, 8, 0, 0))
cars= Car.new("Maria Pop",Time.new(2021, 04, 19, 15, 30, 0))
cars= Car.new("Dan Boga",Time.new(2021, 04, 20, 9, 0, 0))

def show_schedule 
  puts "CAR CLEANING SERVICE IS CLOSED!"
  puts "Opening times"
  puts "MONDAY - FRIDAY 8:00 - 18:00"
  puts "SATURDAY 8:00 - 16:00"
  puts "SUNDAY CLOSED"
  puts "!If you don't have an appointment, please come with two hours before closing time!" 
end

def check_opening_time(time)
 return ((time.sunday?) || (time.hour < 8) || ((time + 7200).hour >= 18) || ((time.saturday?) && ((time + 7200).hour >= 16)))
end

def set_time(user, time)
  puts "Dear, #{user} your car will be ready on #{time.strftime("%d %B %Y")} at #{time.strftime("%H:%M")}."
end

def check_schedule(time) 
  pres = 0
  Car.all.each {|car| pres+=1 if ((car.drop_time > time && car.drop_time < time + 7200) || ( car.pickup_time > time && car.pickup_time < time + 7200))}
  return true if pres == 2
  return false
end

def add_appointment(time)
  puts "What is your name?"
  name = gets.chomp
  if (name[/[a-zA-Z]*/] != name)
    raise "non-valid name"
  end
  new_car = Car.new(name, time)
  set_time(name, time + 7200)
rescue 
  puts "Please enter a valid name. It should not contain any numbers or special characters"
end

def add_appointment_now
  if check_opening_time(Time.now)
    show_schedule
  elsif check_schedule(Time.now)
    puts "There is no available car wash machine at this moment. Would you like to make an appointment?"
  else 
    add_appointment(Time.now)
  end
end

def show_appointments 
  Car.all.each {|car| puts "#{car.user_name}, #{car.drop_time.strftime("%d %B %Y %H:%M")}, #{car.pickup_time.strftime("%d %B %Y %H:%M")}" if car.pickup_time > Time.now}
end

def check_car_status
  pres = 0
  puts "What is your name?"
  name = gets.chomp
  puts ""
  Car.all.each{ |car|
    if (car.user_name == name)
      pres = 1
      if car.pickup_time > Time.now && car.drop_time < Time.now
        puts "Dear #{car.user_name}, your car is cleaning right now. It will be ready at #{car.pickup_time.strftime("%H:%M")}"
      elsif car.drop_time > Time.now
        puts "Dear #{car.user_name}, your appointment is on #{car.drop_time.strftime("%d %B %Y")} at #{car.drop_time.strftime("%H:%M")}"
        puts "The car will be ready at #{car.pickup_time.strftime("%H:%M")}"
      else
        puts "Dear #{car.user_name}, your car is ready! We are waiting for you to pick it up"
      end
    end
  }
  puts "There is no appointment with this name!!" if (pres == 0)
end

def make_new_appointment 
  puts "Make an appointment\n"
  puts "Choose a month: \n1-January \n2-February\n3-March\n4-April\n5-May\n6-June\n7-July\n8-August\n9-September\n10-October\n11-November\n12-December"
  month = gets.chomp.to_i 
  puts "Which day?"
  day = gets.chomp.to_i
  puts "At what time?(hour)"
  hour = gets.chomp.to_i
  puts "minutes:"
  min = gets.chomp.to_i
  puts ""
  if Time.new(2021, month, day, hour, min, 0) < Time.now 
    puts "Please enter a valid data, we can't wash your car in the past.."
  elsif check_opening_time(Time.new(2021, month, day, hour, min, 0))
    show_schedule
  elsif check_schedule(Time.new(2021, month, day, hour, min, 0))
    puts "There is no available car wash machine at this moment. Please check our appointments schedule and try another date or time"
  else
    add_appointment(Time.new(2021, month, day, hour, min, 0))
  end
rescue ArgumentError
  puts "Please enter valid data and time. Month 1-12, Day 1-31, Hour 1-24, Minutes 0-59"
end

puts ""
puts "        WELCOME TO OUR CAR CLEANING SERVICE! \n"
puts "       Caring for your vehicle is our business"
puts "              Clean cars run better."

option = 0

while(option != 5)
  puts ""
  puts "How can we help you? "
  puts "1. I want my car to be cleaned now"
  puts "2. I want to make an appointment"
  puts "3. I want to check my car cleaning status"
  puts "4. I want to check the car cleaning service schedule"
  puts "5. Exit"
  puts ""
  option = gets.chomp
  case option
  when "1"
    add_appointment_now
  when "2"
    make_new_appointment
  when "3" 
    check_car_status
  when "4"
    show_appointments
  when "5"
    puts "Thank you for choosing our car cleaning service." 
    puts "We are waiting for you to come back, don't forget: A clean car is a happy car"
    puts "Have a good one!"
    break
  else
    puts "Please enter a number from 1-5 (1,2,3,4,5)"
  end
end
