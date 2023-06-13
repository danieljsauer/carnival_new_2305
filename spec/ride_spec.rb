require 'spec_helper'

describe Ride do
  describe "initialize" do 
    it "exists" do 
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      expect(ride1).to be_instance_of(Ride)
    end 

    it "has name, min_height, admission_fee, excitement, as instance values within a hash" do 
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      expect(ride1.name).to eq("Carousel")
      expect(ride1.min_height).to eq(24)
      expect(ride1.admission_fee).to eq(1)
      expect(ride1.excitement).to eq (:gentle)
    end 

    it "keeps track of revenue" do 
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      expect(ride1.total_revenue).to eq(0)
    end

    it "has a rider log hash" do 
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      expect(ride1.rider_log).to eq ({})
    end 
  end 

  describe "instance methods" do 
    it "can add riders into rider log if they are tall enough and have enough cash" do 
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor2 = Visitor.new('Tucker', 20, '$5')
      visitor3 = Visitor.new('Penny', 64, '$0')
      expect(ride1.board_rider(visitor2)).to eq("#{visitor2.name} is not tall enough!")
      expect(ride1.board_rider(visitor3)).to eq("#{visitor3.name} cannot afford it!")
    end 

    it "can only add riders if they prefer the ride type" do 
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, "$10")
      expect(ride1.board_rider(visitor1)).to eq("#{visitor1.name} does not like that kind of ride!")
    end 

    it "can add riders to rider log" do 
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, "$10")
      visitor1.add_preference(:gentle)
      ride1.board_rider(visitor1)
      expect(ride1.rider_log[visitor1.name]).to eq(visitor1)
    end    

    it "adds revenue for a successfully boarded rider and rider cash is correctly deducted" do 
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, "$10")
      visitor1.add_preference(:gentle)
      ride1.board_rider(visitor1)
      expect(ride1.total_revenue).to eq(1)
      expect(visitor1.spending_money).to eq(9)
    end 
    
    it "can add multiple riders" do 
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, "$10")
      visitor3 = Visitor.new('Penny', 64, '$10')

      visitor1.add_preference(:gentle)
      visitor3.add_preference(:gentle)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor3)

      expect(ride1.rider_log).to include(visitor1.name, visitor3.name)
      expect(ride1.rider_log.keys.count).to eq(2)
    end 


    # I am not currently keeping track of how many times a rider has ridden that particular ride. I will get to this later if I have time. 
    # add test for that here if you get to it. 

  end 
end 