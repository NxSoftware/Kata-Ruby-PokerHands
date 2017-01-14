class Card
  attr_reader :value
  attr_reader :suit
  
  def initialize(value, suit)
    @value = value
    @suit = suit
  end
  
  def ==(other)
    self.class == other.class && @value == other.value && @suit == other.suit
  end
  
  def <=>(other)
    self.value <=> other.value
  end
end

module Suit
  module_function
  
  HEARTS = 'H'
  DIAMONDS = 'D'
  CLUBS = 'C'
  SPADES = 'S'
  
  def is_valid?(suit)
    [
      Suit::HEARTS,
      Suit::DIAMONDS,
      Suit::CLUBS,
      Suit::SPADES
    ].include? suit
  end
end

module CardFace
  TEN = 'T'
  JACK = 'J'
  QUEEN = 'Q'
  KING = 'K'
  ACE = 'A'
end
