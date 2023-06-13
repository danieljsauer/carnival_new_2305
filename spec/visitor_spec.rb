require 'spec_helper'

describe Visitor do
  describe "initialize" do 
    it "exists" do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      expect(visitor1).to be_instance_of(Visitor)
    end 

    it "has name,height,cash values" do 
      visitor1 = Visitor.new('Bruce', 54, '$10')
      expect(visitor1.name).to eq("Bruce")
      expect(visitor1.height).to eq(54)
      expect(visitor1.spending_money).to eq(10)
    end 

    it "has ride preferences" do 
      visitor1 = Visitor.new('Bruce', 54, '$10')
      expect(visitor1.preferences).to eq([])
    end 
  end 

  describe "instance methods" do 
    it "can add rides to preferences" do 
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor1.add_preference(:gentle)
      expect(visitor1.preferences).to eq([:gentle])
      visitor1.add_preference(:thrilling)
      expect(visitor1.preferences).to eq([:gentle, :thrilling])
    end 

    it "can check if visitor is tall enough" do 
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      expect(visitor1.tall_enough?(54)).to be true 
      expect(visitor2.tall_enough?(54)).to be false 
    end 
  end 

end 