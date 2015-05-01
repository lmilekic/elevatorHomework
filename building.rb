class Building
  @floors
  def initialize
    @floors = []
  end
  def to_s
    result = ""
    @floors.each do |floor|
      result = floor.to_s + "\n" + result #reverse print it
    end
    result
  end
  def add_floor(item)
    @floors << item
  end
  def add_floors(n)
    (0..n-1).each do |num|
      add_floor(Floor.new(num))
    end
  end
  def add_person(person, floor)
    @floors[floor].add_person(person)
  end
  def get_floor(n)
    if(@floors.size >= n)
      @floors[n]
    else
      raise 'that floor does not exist'
    end
  end
end
