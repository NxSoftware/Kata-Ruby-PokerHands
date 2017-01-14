class PokerHand
  
  def initialize(cards)
    @cards = cards
  end
  
  def high_card
    @cards.sort.last
  end
  
  def pair
    counts = {}
    @cards.each do |card|
      count = (counts[card.value] || 0) + 1
      counts[card.value] = count
    end
    
    pairs = counts.select do |value, count|
      count == 2
    end
    
    pairs.keys.first
  end
  
  def two_pair
    counts = {}
    @cards.each do |card|
      count = (counts[card.value] || 0) + 1
      counts[card.value] = count
    end
    
    pairs = counts.select do |value, count|
      count == 2
    end
    
    pairs.keys.sort
  end
  
end
