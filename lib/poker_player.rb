class PokerPlayer
  
  attr_accessor :cards
  
  def initialize(cards_string)
    @cards = cards_string.split ' '
  end
  
end
