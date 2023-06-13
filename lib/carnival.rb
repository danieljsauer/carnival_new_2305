class Carnival

  attr_reader :name, :duration, :rides 

  def initialize(name, duration)
    @name = name
    @duration = duration
    @rides =[]
  end 

  def add_ride(ride)
    @rides << ride
  end 

  def most_profitable
    return "No rides at carnival :(" if @rides.empty?
  
    most_profitable_ride = @rides[0]
    max_revenue = 0
  
    @rides.each do |ride|
      if ride.total_revenue > max_revenue
        max_revenue = ride.total_revenue
        most_profitable_ride = ride
      end
    end
  
    most_profitable_ride.name
  end

  def total_revenue
    total_revenue = 0
    @rides.each do |ride|
      total_revenue += ride.total_revenue
    end
    total_revenue
  end 
  
end 