class Floor
  attr_accessor :people, :floor_number
  @people
  #@elevators
  @floor_number
  def initialize(floor_num)
    @people = []
    @done_people = []
    @floor_number = floor_num
  end

  def add_person(person)
    @people << person
  end

  def add_done_person(person)
    @done_people << person
  end
  def to_s
    "|-------| wait: #{@people.size} | done: #{@done_people.size}"
  end
end
