class Visitor

  attr_reader :name, :height, :preferences, :spending_money 

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.gsub("$", "").to_f
    #I just realized at 11:25 that I changed this ^ value in my tests to an integer. My solution is to keep the returns as an integer and just initialize this value from a string as an integer with the $ removed.
    #This feels like a sloppy fix but this is the best solution I can think of given my current time constraints. Such a silly mistake! Will pay more attention to my interaction pattern next time. 
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