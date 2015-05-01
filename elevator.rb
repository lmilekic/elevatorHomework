class Elevator
  attr_accessor :home_floor, :current_floor_num, :people, :goal_floor
  @waiting_queue
  def initialize(floor)
    @home_floor = floor
    @current_floor_num = floor
    @people = []
    @goal_floor = floor
    @waiting_queue = []
  end
  def add_person(person)
    if(@people.empty?)
      @goal_floor = person.destination
    end
    @people << person
  end
  def clock_tick(current_floor)
    pick_people_up(current_floor)
    if(at_goal)
      change_goal_floor
      if(@people.empty?)
        @current_floor_num = change_floor
      else
        @people.each do |person|
          if person.destination == @current_floor_num
            current_floor.add_done_person(@people.delete(person))
          end
        end
      end
    else
      @current_floor_num = change_floor
    end
  end

  def change_floor
    if(@current_floor_num > @goal_floor)
      @current_floor_num - 1
    else
      @current_floor_num + 1
    end
  end

  def change_goal_floor
    if(!@people.empty?)
      @goal_floor = @people.first.destination
    elsif(@waiting_queue.empty?) #no one is waiting for the elevator
      @goal_floor = @home_floor
    else
      @goal_floor = @waiting_queue.pop
    end
  end
  def at_goal
    @current_floor_num == @goal_floor
  end

  def pick_people_up(floor)
    floor.people.each do |person|
      @people << floor.people.delete(person)
    end
  end

  def add_to_queue(floor)
    @waiting_queue.push(floor)
  end
end
