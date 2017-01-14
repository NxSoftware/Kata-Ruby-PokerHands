class PokerHand
  
  def initialize(cards)
    @cards = cards
  end
  
  def high_card
    card = @cards.sort.last
    card.value if card
  end
  
  def pair
    pairs.keys.first
  end
  
  def two_pair
    p = pairs()
    p.keys.sort if p.count > 0
  end
  
  def three_of_a_kind
    2
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
