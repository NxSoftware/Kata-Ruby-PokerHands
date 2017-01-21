class PokerHandWinner
  
  attr_reader :hand

  def initialize(winning_hand)
    @hand = winning_hand
  end

  def self.winner(hand1, hand2)
    if hand1.class == PokerHand && hand2.class == PokerHand then
      PokerHandWinner.new [hand1, hand2].max
    end
  end
  
  def to_s
    @hand.rank.inspect
  end
  
end
