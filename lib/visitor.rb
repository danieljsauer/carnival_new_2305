class Visitor

  attr_reader :name, :height, :preferences
  attr_accessor :spending_money
  #I know this is poor principles but I needed to move on to the next method.

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money
    @preferences = []
  end 

  def add_preference(preference)
    @preferences << preference
  end 

  def tall_enough?(requirement)
    @height >= requirement
  end 

end 