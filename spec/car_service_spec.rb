require_relative '../controllers/controller.rb'

describe 'check open times' do

	context 'when sunday' do
	  let(:time) { Time.new(2021, 04, 25, 9, 00, 0) }
		
		it 'return true' do
			expect(check_opening_time(time)).to eq (true)
		end
	end

	context 'when saturday after 16:00' do
		let(:time) { Time.new(2021, 04, 24, 16, 00, 0) }
			
		it 'return true' do
			expect(check_opening_time(time)).to eq (true)
		end
	end

	context 'when saturday before 14:00' do
		let(:time) { Time.new(2021, 04, 24, 13, 59, 0) }
			
		it 'return false' do
			expect(check_opening_time(time)).to eq (false)
		end
	end

	context 'when week day before 16:00' do
		let(:time) { Time.new(2021, 04, 23, 15, 59, 0) }
			
		it 'return false' do
			expect(check_opening_time(time)).to eq (false)
		end
	end

	context 'when week day before 8:00' do
		let(:time) { Time.new(2021, 04, 23, 7, 59, 0) }
			
		it 'return true' do
			expect(check_opening_time(time)).to eq (true)
		end
	end

	context 'when week day between 8:00 and 16:00' do
		let(:time) { Time.new(2021, 04, 23, 8, 01, 0) }
			
		it 'return false' do
			expect(check_opening_time(time)).to eq (false)
		end
	end
end

describe 'check cars wash machines availability' do 

	context 'when both car wash machines are available' do
		before(:each) { $cars = $cars.clear() }

		it 'return false' do 
			expect(check_schedule(Time.now)).to eq (false)
		end
	end

	context 'when only one car wash machine is available' do
		before(:each) do 
			$cars = $cars.clear()
			$cars << Car.new("Mary Test", Time.now, "AN12345")
		end
		
		it 'return false' do
			expect(check_schedule(Time.now)).to eq (false)
		end
	end

	context 'when no available car wash machine' do
		before(:each) do
			$cars = $cars.clear()
			$cars << Car.new("Mary Test", Time.now, "AN12345")
			$cars << Car.new("Johnny Test", Time.now, "DN45678")
		end
		
		it 'return true' do 
			expect(check_schedule(Time.now)).to eq (true)
		end
	end
end



