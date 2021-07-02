require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'No working bikes available' if all_broken?
    @bikes.delete(next_working_bike)
  end

  def dock(bike)
    fail 'Docking station is full' if full?
    @bikes << bike
  end

  attr_reader :bikes

  attr_reader :capacity

  private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

  def all_broken?
    @bikes.all? { |bike| bike.broken? }
  end

  def next_working_bike
    @bikes.select { |bike| !bike.broken? }.last
  end
end