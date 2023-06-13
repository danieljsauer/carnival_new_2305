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
end 