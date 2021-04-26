$cars = []

class Car
  attr_reader :user_name, :drop_time, :license_plate
  attr_accessor :pickup_time

  def initialize(user_name, time, license_plate)
    @user_name = user_name
    @drop_time = time
    @pickup_time = (time + 7200)
    @license_plate = license_plate
  end
end

$cars << Car.new('Isabella Kramer', Time.new(2021, 4, 23, 8, 30, 0), 'CD80519')
$cars << Car.new('Benn Davie', Time.new(2021, 4, 23, 9, 30, 0),'AM59232')
$cars << Car.new('Lillian Hewitt', Time.new(2021, 4, 23, 11, 15, 0), 'BB13822')
$cars << Car.new('Amelia Cherry', Time.new(2021, 4, 23, 11, 45, 0), 'ZK05821')
$cars << Car.new('Benn Davie', Time.new(2021, 4, 23, 15, 30, 0), 'AN23001')
$cars << Car.new('Adam Tristin', Time.new(2021, 4, 24, 14, 00, 0), 'TN41312')
$cars << Car.new('Bernard Warren', Time.new(2021, 4, 24, 8, 00, 0), 'CF71829')

def show_schedule 
  puts 'OPENING TIMES'
  puts ''
  puts 'MONDAY - FRIDAY 8:00 - 18:00'
  puts 'SATURDAY 8:00 - 16:00'
  puts 'SUNDAY CLOSED'
  puts ''
  puts "!If you don't have an appointment, please come with two hours before closing time!" 
end
