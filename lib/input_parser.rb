require_relative 'poker_player.rb'

class PokerInputParser
  
  attr_reader :players
  
  def initialize(input)
    @players = input.split('  ').map do |p|
      PokerPlayerParser.parse p
    end
  end
  
end

class PokerPlayerParser
  def self.parse(input)
    (colour, cards) = input.split(': ')
    PokerPlayer.new colour, cards
  end
end
