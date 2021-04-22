require "/home/andreea/Desktop/Assignment2_CarCleaningService/Model/model.rb"

def check_opening_time(time)
 return ((time.sunday?) || (time.hour < 8) || ((time + 7200).hour >= 18) || ((time + 7200).hour == 0)|| ((time.saturday?) && ((time + 7200).hour >= 16)))
end

def set_time(user, time)
  puts "Dear, #{user} your car will be ready on #{time.strftime("%d %B %Y")} at #{time.strftime("%H:%M")}."
end

def check_schedule(time) 
  count_cars_in_a_time_interval = 0
  
  $cars.each {|car| count_cars_in_a_time_interval += 1 if ((car.drop_time > time && car.drop_time < time + 7200) || (car.pickup_time > time && car.pickup_time < time + 7200))}
  
  return true if count_cars_in_a_time_interval >= 2
  return false
end

def add_appointment(time)
  regular_name = /([\w\-\']{2,})([\s]+)([\w\-\']{2,})/

  puts "What's your name?"
  name = gets.chomp

  if !name.match(regular_name)
    raise "non-valid name"
  end

  name = name.gsub(/\s+/, " ").strip

  $cars << Car.new(name, time)

  set_time(name, time + 7200)
  
rescue 
  puts "Please enter a valid name(e.g: Firstname Surname). It should not contain any numbers or special characters"
end

def add_appointment_now
  
  if check_opening_time(Time.now)
    puts "CAR CLEANING SERVICE IS CLOSED!"
    show_schedule

  elsif check_schedule(Time.now)
    puts "There is no available car wash machine at this moment. Would you like to make an appointment?"
  
  else 
    add_appointment(Time.now)
  end
end

def show_appointments 
  $cars.each {|car| puts "Drop time: #{car.drop_time.strftime("%d %B %Y %H:%M")}, Pick up time: #{car.pickup_time.strftime("%H:%M")}" if car.pickup_time > Time.now}
end

def check_car_status
  is_name_in_list = false

  puts "What's your name?"
  name = gets.chomp
  puts ""

  $cars.each do |car|
    next unless car.user_name == name
      is_name_in_list = true
      
      if car.pickup_time > Time.now && car.drop_time < Time.now
        puts "Dear #{car.user_name}, your car is cleaning right now. It will be ready at #{car.pickup_time.strftime("%H:%M")}"

      elsif car.drop_time > Time.now
        puts "Dear #{car.user_name}, your appointment is on #{car.drop_time.strftime("%d %B %Y")} at #{car.drop_time.strftime("%H:%M")}"
        puts "The car will be ready at #{car.pickup_time.strftime("%H:%M")}"
     
      else
        puts "Dear #{car.user_name}, your car is ready! We are waiting for you to pick it up from our car parking."
      end
    end

  puts "There is no appointment with this name!!" if (is_name_in_list == false)
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
	
  case 
  when Time.new(2021, month, day, hour, min, 0) < Time.now
    puts "Please enter a valid data, we can't wash your car in the past.."
	
  when check_opening_time(Time.new(2021, month, day, hour, min, 0))
    show_schedule
		
  when check_schedule(Time.new(2021, month, day, hour, min, 0))
    puts "There is no available car wash machine at this moment. Please check our appointments schedule and try another date or time"
	
  else 
    add_appointment(Time.new(2021, month, day, hour, min, 0))
  
	end
  rescue ArgumentError
    puts "Please enter valid data and time. Month 1-12, Day 1-31, Hour 1-24, Minutes 0-59"
end
