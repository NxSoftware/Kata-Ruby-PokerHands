require_relative 'poker_player.rb'

class PokerInputParser
  
  attr_reader :players
  
  def initialize(input)
    @players = [
      PokerPlayer.new('2H 3D 5S 9C KD'),
      PokerPlayer.new('2C 3H 4S 8C AH'),
    ]
  end
  
end
