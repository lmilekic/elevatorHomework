require './sim.rb'

describe Person do
  it "should have a destination floor" do
    Person.new(1).destination.should == 1
  end
end
