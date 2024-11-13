class Round
  attr_accessor :players, :sides, :round_results

  def initialize(players, sides)
    @players = players
    @sides = sides
    @round_results = []  
  end

  # Plays a given round for a player
  def play_round(player, round_number)
    player.roll_dice
    rolled_values = player.dice.map(&:roll_value)

    player.remove_dice

    player.add_score

    # Add player's results to round_results
    @round_results << { 
      name: player.name, 
      score: player.score, 
      dice_left: player.dice.map(&:roll_value), 
      dice: rolled_values, 
      status: player.has_dice_left? ? nil : 'Out' 
    }

    # Display player results for the current round
    display_player_results(player, round_number)

    # End the round if both players are out
    if both_players_out?
      puts "Round #{round_number} is over as both players are out!"
    end
  end

  def both_players_out?
    @players.all? { |player| player.dice.empty? }
  end

  def display_player_results(player, round_number)
    puts "\nRound: #{round_number}"
    puts "#{player.name} rolled: #{player.dice.map(&:roll_value)}" # Displays rolled values
    puts "#{player.name} score: #{player.score} - Dice left: #{player.dice.map(&:roll_value)}\n"
  end
end