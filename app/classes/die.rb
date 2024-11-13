class Die
  attr_accessor :roll_value, :sides

  def initialize(sides)
    @sides = sides
    @roll_value = 0
  end

  def roll
    @roll_value = rand(1..@sides)
  end

  # Prints out the Die's value (for debugging/inspecting purposes)
  def inspect
    @roll_value.to_s
  end
end