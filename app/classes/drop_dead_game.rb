class DropDeadGame
  attr_accessor :players, :rounds, :scorekeeper

  def initialize(player_count, dice_count, sides)
    @players = create_players(player_count, dice_count, sides)
    @rounds = [] 
    @scorekeeper = Scorekeeper.new(@players)
  end

  def create_players(player_count, dice_count, sides)
    (1..player_count).map do |i|
      Player.new("Player #{i}", dice_count, sides)
    end
  end

  def play_game
    round_number = 1

    while @players.any? { |player| player.has_dice_left? }
      puts "\n--- Round #{round_number} ---"
      
      round = Round.new(@players, 6) 
      
      @players.each do |player|
        round.play_round(player, round_number) if player.has_dice_left?
      end

      # Keeps track of the results per round
      @rounds.push(round.round_results)  

      round_number += 1
    end

    declare_winner
  end

  def declare_winner
    winner = @players.max_by(&:score)  
    puts "\n#{winner.name} has won with a total score of #{winner.score}!"
  end
end