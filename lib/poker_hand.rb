class PokerHand
  
  def initialize(cards)
    @cards = cards
  end
  
  def high_card
    @cards.last
  end
  
end
