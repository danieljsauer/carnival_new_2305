class Ride 

  attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue, :rider_log

  def initialize(ride_details)

    @name = ride_details[:name]
    @min_height = ride_details[:min_height]
    @admission_fee = ride_details[:admission_fee]
    @excitement = ride_details[:excitement]
    @total_revenue = 0
    @rider_log = {}
  end 

  def board_rider(visitor)
    if !visitor.tall_enough?(@min_height)
      return "#{visitor.name} is not tall enough!"
    elsif visitor.spending_money.to_f < @admission_fee.to_f
      return "#{visitor.name} cannot afford it!"
    end
  end 

end 