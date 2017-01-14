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
    cards_occurring(3).keys.first
  end
  
  def straight
    previous_card = @cards.first
    streak = 1
    (1...@cards.count).each do |i|
      card = @cards[i]
      streak += 1 if card.value - previous_card.value == 1
      previous_card = card
    end
    
    @cards.last.value if streak == 5
  end
  
  private
  def pairs
    cards_occurring 2
  end
  
  def cards_occurring(times)
    counts.select do |value, count|
      count == times
    end
  end
  
  def counts
    @cards.each_with_object(Hash.new(0)) do |card, hash|
      hash[card.value] += 1
    end
  end
  
end
