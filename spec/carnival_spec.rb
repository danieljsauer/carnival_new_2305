require 'spec_helper'

describe Carnival do
  describe "initialize" do 
    it "exists" do 
      carnival = Carnival.new("Twistys", 14)
      expect(carnival).to be_instance_of(Carnival)
    end 

    it "initializes with name, duration, and rides variables" do 
      carnival = Carnival.new("Twistys", 14)
      expect(carnival.name).to eq("Twistys")
      expect(carnival.duration).to eq(14)
      expect(carnival.rides).to eq([])
    end 
  end 

  describe "instance methods" do 
    it "can add rides" do 
      carnival = Carnival.new("Twistys", 14)
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      carnival.add_ride(ride1)
      expect(carnival.rides).to eq([ride1])
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      carnival.add_ride(ride2)
      expect(carnival.rides).to eq([ride1,ride2])
      expect(carnival.rides.count).to eq(2)
    end 
  end 
end 