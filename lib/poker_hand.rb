class PokerHand
  
  def initialize(cards)
    @cards = cards
  end
  
  def high_card
    @cards.sort.last
  end
  
end
