require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if @bikes.length < 1
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station is full' unless @bikes.length < 20
    @bikes << bike
    bike
  end

  attr_reader :bikes
end