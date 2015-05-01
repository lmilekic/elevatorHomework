require './sim.rb'

def make_building(floors)
  b = Building.new
  b.add_floors(floors)
  b
end
s = Simulation.new
s.add_building(make_building(10))

e = Elevator.new(0)
e.add_person(Person.new(3))
s.add_elevator(e)

s.add_person(Person.new(8), 2)
s.add_person(Person.new(0), 9)
s.clock_ticks()
