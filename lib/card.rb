class Card
  attr_reader :description
  attr_reader :value
  attr_reader :suit
  
  def initialize(value, suit)
    @description = "#{value}"
    @value = value
    @suit = suit
  end
  
  def ==(other)
    self.class == other.class && @description == other.description
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
