class PokerHand
  
  def initialize(cards)
    @cards = cards
  end
  
  def high_card
    @cards.sort.last
  end
  
  def pair
    return 2
  end
  
end
