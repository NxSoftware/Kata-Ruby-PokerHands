require_relative 'card.rb'

class PokerPlayer
  
  attr_accessor :cards
  
  def initialize(colour, cards)
    @colour = colour
    @cards = cards
  end
  
end
