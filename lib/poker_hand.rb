class PokerHand
  
  def initialize(cards)
    @cards = cards
  end
  
  def high_card
    @cards.sort.last
  end
  
  def pair
    pairs.keys.first
  end
  
  def two_pair
    p = pairs()
    p.keys.sort if p.count > 0
  end
  
  private
  def pairs
    counts = {}
    @cards.each do |card|
      count = (counts[card.value] || 0) + 1
      counts[card.value] = count
    end
    
    counts.select do |value, count|
      count == 2
    end
  end
  
end
