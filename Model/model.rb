$cars = []

class Car
  attr_reader :user_name, :drop_time
  attr_accessor :pickup_time

  def initialize(user_name, time)
    @user_name = user_name
    @drop_time = time
    @pickup_time = (time + 7200)
  end
end

$cars << Car.new("Isabella Kramer", Time.new(2021, 04, 22, 8, 30, 0))
$cars << Car.new("Benn Davie", Time.new(2021, 04, 22, 9, 30, 0))
$cars << Car.new("Lillian Hewitt", Time.new(2021, 04, 22, 11, 30, 0))
$cars << Car.new("Amelia Cherry", Time.new(2021, 04, 22, 11, 45, 0))
$cars << Car.new("Benn Davie", Time.new(2021, 04, 22, 9, 00, 0))
$cars << Car.new("Adam Tristin ", Time.new(2021, 04, 23, 14, 00, 0))
$cars << Car.new("Bernard Warren ", Time.new(2021, 04, 23, 8, 00, 0))


def show_schedule 
  puts "OPENING TIMES"
  puts ""
  puts "MONDAY - FRIDAY 8:00 - 18:00"
  puts "SATURDAY 8:00 - 16:00"
  puts "SUNDAY CLOSED"
  puts "!If you don't have an appointment, please come with two hours before closing time!" 
end
