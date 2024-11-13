class Scorekeeper
    attr_accessor :players
  
    def initialize(players)
      @players = players
    end
  
    # Returns the maximum score for the given player
    def find_winner
      @players.max_by(&:score)
    end
  end