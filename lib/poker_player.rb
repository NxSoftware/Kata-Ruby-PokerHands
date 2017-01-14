class PokerPlayer
  
  attr_accessor :cards
  
  def initialize(colour, cards_string)
    @colour = colour
    @cards = cards_string.split ' '
  end
  
end
