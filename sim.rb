require './building.rb'
require './floor.rb'
require './person.rb'
require './elevator.rb'
class Simulation
  @elevators
  @building
  def initialize
    @elevators = []
    @building = nil
  end
  def add_elevator(elevator)
    @elevators << elevator
  end
  def add_building(building)
    @building = building
  end
  def clock_ticks()
    input = ""
    while(input != "end")
      @elevators.each do |el|
        floor_num = el.current_floor_num
        el.clock_tick(@building.get_floor(floor_num))
      end
      puts self.to_s
      puts
      puts "press enter to go to next tick, end to stop"
      input = gets.chomp
    end
  end
  def to_s
    result = ""
    @elevators.each do |el|
      result += "Elevator at: #{el.current_floor_num}\n"
      result += "Elevator carrying: #{el.people.size}\n"
    end
    result += @building.to_s
    result
  end
  def add_person(person, floor)
    @elevators.each do |el|
      el.add_to_queue(floor)
    end
    @building.add_person(person, floor)
  end
end
