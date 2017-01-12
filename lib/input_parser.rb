require_relative 'poker_player.rb'

class PokerInputParser
  
  attr_reader :players
  
  def initialize(input)
    @players = [PokerPlayer.new, PokerPlayer.new]
  end
  
end
