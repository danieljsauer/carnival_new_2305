class Visitor

  attr_reader :name, :height, :preferences, :spending_money 

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

  def spend(money)
    @spending_money -= money
  end 

end 