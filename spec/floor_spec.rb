require './sim.rb'

describe Floor do
  it "should know it's floor number" do
    Floor.new(10).floor_number.should == 10
  end
  it "should store people" do
    f = Floor.new(10)
    p = Person.new(10)
    f.add_person(p)
    f.people.first.should == p
  end
end
