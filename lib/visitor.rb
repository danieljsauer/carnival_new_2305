class Visitor

  attr_reader :name, :height, :preferences
  attr_accessor :spending_money
  #I know this is poor principles but I needed to move on to the next method.
  #I think I would fix this by adding a spend money method or something of the sort, and calling it in the board_rider method

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