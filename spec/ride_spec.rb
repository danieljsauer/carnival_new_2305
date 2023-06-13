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
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 20, '$5')
      visitor3 = Visitor.new('Penny', 64, '$0')
      expect(ride1.board_rider(visitor2)).to eq("#{visitor2.name} is not tall enough!")
      expect(ride1.board_rider(visitor3)).to eq("#{visitor3.name} cannot afford it!")

      ride1.board_rider(visitor1)
      expect(ride1.rider_log).to include(visitor1)
    end 
  end 

end 