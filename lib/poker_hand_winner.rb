class PokerHandWinner
  
  attr_reader :hand

  def initialize(winning_hand)
    @hand = winning_hand
  end

  def self.winner(hand1, hand2)
    if hand1.class == PokerHand then
      PokerHandWinner.new hand1
    end
  end
  
end
