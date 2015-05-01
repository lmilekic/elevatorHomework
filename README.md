[![Code Climate](https://codeclimate.com/github/lmilekic/elevatorHomework/badges/gpa.svg)](https://codeclimate.com/github/lmilekic/elevatorHomework)
#Elevator Homework
# elevator
one last project for cosi 105b: an elevator simulation.

### Basic Structure ###

##### Building #####
* Creates and sets up `Floors`
* Stores `Floors`

##### Floor #####
* Contains a list of `People` who are waiting and who have arrived at that floor.

##### Person #####
* Knows its destination of choice.

##### Elevators #####
* First checks to see where people in the elevator want to go, picking up more people on the way to that destination
* Once it has delivered the people inside to it's destination it checks it's queue of spots people are/were waiting.
* This can lead to it going to empty floors because it already picked up the people at that floor

##### Testing #####
* I used Test Driven Development for this project, and I was quite pleased with how it worked out.

##### Some interesting design choices #####
* My Elevator code takes in the floor as a parameter to see if it's at the right floor, which makes it more dependent on it, but it allows different implementation of floors as long as they still have a people array/list.
* Instead of running for a set number of ticks my code asks the user to continue or stop each tick (it's not as annoying as it sounds).
