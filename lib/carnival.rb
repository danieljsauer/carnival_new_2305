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

  def most_popular 
    return "No rides at carnival :(" if @rides.empty?
    most_popular = @rides[0]
    ride_count = 0 
    @rides.each do |ride|
      if ride.rider_log.keys.count > ride_count
        ride_count = ride.rider_log.keys.count
        most_popular = ride 
      end 

    end 
    most_popular.name 
  end 

      #idea is to check for the number of keys in the ride object. not a perfect solution but best I am going to do right now.
      #basing this off of my most profitable method more or less. 
      #wow, cant belive that worked first try. Submitting pull request here.  
    #this obviously only returns how many visitors have ridden the ride, does not include repeat rides by same visitor
end 