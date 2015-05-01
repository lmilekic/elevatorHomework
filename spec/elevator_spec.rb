require './sim.rb'

describe Elevator do
  it "should have a 'home floor'" do
    Elevator.new(4).home_floor.should == 4
  end
  it "should have a current floor" do
    Elevator.new(3).current_floor_num.should == 3
  end
  it "should add people" do
    p = Person.new(4)
    a = Elevator.new(4)
    a.add_person(p)
    a.people.first.should == p
  end
  it "should move people off the elevator when they're at the right floor" do
    p = Person.new(4)
    a = Elevator.new(4)
    a.add_person(p)
    f = Floor.new(4)
    a.clock_tick(f)
    a.people.should == []
    f.people.first.should == p
  end
  it "should move to the right floor when not on it" do
    p = Person.new(5)
    a = Elevator.new(4)
    a.add_person(p)
    f = Floor.new(4)
    a.clock_tick(f)
    a.people.should == [p]
    a.current_floor_num.should == 5
  end
  it "should move to the right floor when not on it and let people off there" do
    p = Person.new(5)
    a = Elevator.new(4)
    a.add_person(p)
    f = Floor.new(4)
    a.clock_tick(f)
    f = Floor.new(5)
    a.clock_tick(f)
    a.people.should == []
    f.people.first.should == p
  end

end
