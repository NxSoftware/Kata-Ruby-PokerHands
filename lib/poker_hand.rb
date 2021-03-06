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
    p.keys.sort if p.count == 2
  end
  
  def three_of_a_kind
    n_of_a_kind 3
  end
  
  def straight
    sorted_cards = @cards.sort
    previous_card = sorted_cards.shift
    streak = 1
    sorted_cards.each do |card|
      streak += 1 if card.value - previous_card.value == 1
      previous_card = card
    end
    
    sorted_cards.last.value if streak == 5
  end
  
  def flush
    five_of_same_suit = cards_of_same_suit_occurring 5
    @cards.sort.last.value unless five_of_same_suit.empty?
  end
  
  def full_house
    pair = pairs
    three_oak = cards_of_same_value_occurring 3
    
    if pair.count == 1 && three_oak.count == 1
      three_oak.keys.first
    end
  end
  
  def four_of_a_kind
    n_of_a_kind 4
  end
  
  def straight_flush
    straight if flush
  end
  
  def royal_flush?
    straight_flush == CardParser.card_value(CardFace::ACE)
  end
  
  def rank
    value = royal_flush?
    return [:royal_flush] if value
    
    value = straight_flush
    return :straight_flush, value if value
    
    value = four_of_a_kind
    return :four_of_a_kind, value if value
    
    value = full_house
    return :full_house, value if value
    
    value = flush
    return :flush, value if value
    
    value = straight
    return :straight, value if value
    
    value = three_of_a_kind
    return :three_of_a_kind, value if value
    
    value = two_pair
    return :two_pair, value if value
    
    value = pair
    return :pair, value if value
    
    value = high_card
    return :high_card, value
  end
  
  def <=>(other)
    ordered_ranks = [
      :high_card,
      :pair,
      :two_pair,
      :three_of_a_kind,
      :straight,
      :flush,
      :full_house,
      :four_of_a_kind,
      :straight_flush,
      :royal_flush
    ]
    
    this_rank = ordered_ranks.index self.rank[0]
    other_rank = ordered_ranks.index other.rank[0]
    rank_comparison = this_rank <=> other_rank
    
    if rank_comparison == 0 then
      this_value = self.rank[1]
      other_value = other.rank[1]
      this_value <=> other_value
    else
      rank_comparison
    end
  end
  
  private
  def pairs
    cards_of_same_value_occurring 2
  end
  
  def n_of_a_kind(count)
    cards_of_same_value_occurring(count).keys.first
  end
  
  def cards_of_same_value_occurring(times)
    cards_occuring times, counts_by_value
  end
  
  def cards_of_same_suit_occurring(times)
    cards_occuring times, counts_by_suit
  end
  
  def cards_occuring(times, cards)
    cards.select do |value, count|
      count == times
    end
  end
  
  def counts_by_value
    counts_by { |card| card.value }
  end
  
  def counts_by_suit
    counts_by { |card| card.suit }
  end
  
  def counts_by(&predicate)
    @cards.each_with_object(Hash.new(0)) do |card, hash|
      hash[predicate.call card] += 1
    end
  end
  
end
