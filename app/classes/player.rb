require_relative '../../app/classes/die'  

class Player
  attr_accessor :name, :dice, :score

  def initialize(name, dice_count, sides = 6)
    @name = name
    @dice = Array.new(dice_count) { Die.new(sides) }  # Create an array of Die objects
    @score = 0
  end

  # Rolls all the player's dice by calling the Die's roll method
  def roll_dice
    @dice.each { |die| die.roll }  # Rolls each die
  end

  # Removes dice that rolled a 2 or 5
  def remove_dice
    @dice.reject! { |die| die.roll_value == 2 || die.roll_value == 5 }
  end

  # Adds the score for dice rolls that are 1, 3, 4, and 6
  def add_score
    @score += @dice.map(&:roll_value).sum unless @dice.any? { |die| die.roll_value == 2 || die.roll_value == 5 }
  end

  # Checks if the player has any dice left
  def has_dice_left?
    !@dice.empty?
  end
end