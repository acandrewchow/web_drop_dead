class DropDeadGamesController < ApplicationController
  def new
    # Clears previous settings
    session[:player_count] = nil
    session[:dice_count] = nil
    session[:sides] = nil
  end

  def play
    # Use provided params or a fall back to previously stored session values
    player_count = (params[:player_count] || session[:player_count]).to_i
    dice_count = (params[:dice_count] || session[:dice_count]).to_i
    sides = (params[:sides] || session[:sides]).to_i

    session[:player_count] = player_count
    session[:dice_count] = dice_count
    session[:sides] = sides

    # Initialize and play the DropDeadgame
    @game = DropDeadGame.new(player_count, dice_count, sides)
    @game.play_game

    @winner = @game.scorekeeper.find_winner
    @rounds = @game.rounds

    render :play
  end
end