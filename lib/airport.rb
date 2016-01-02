require 'weather'
class Airport
  include Weather

  attr_reader :capacity

  def initialize
    @capacity=5
    @planes_at_airport=[]
    @weather=:sunny

  end

  def land_plane(plane)
    fail 'Do not land, airport is full' if full?
    fail 'Weather is stormy, do not land' if report_weather==:stormy
    fail 'Plane has already landed' if plane.status==:landed
    plane.land
    @planes_at_airport<<plane
  end

  def launch_plane(plane)
    fail 'Weather is stormy, do not take off' if report_weather==:stormy
    fail 'Plane is not here' if @planes_at_airport == @planes_at_airport-[plane]
    plane.take_off
    @planes_at_airport-=[plane]
  end

  private

  def full?
    if (@planes_at_airport.length+1)>@capacity then true else false end
  end

end
