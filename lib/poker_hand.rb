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
    threes = counts.select do |value, count|
      count == 3
    end
    
    threes.keys.first
  end
  
  private
  def pairs
    counts.select do |value, count|
      count == 2
    end
  end
  
  def counts
    c = {}
    @cards.each do |card|
      count = (c[card.value] || 0) + 1
      c[card.value] = count
    end
    c
  end
  
end
