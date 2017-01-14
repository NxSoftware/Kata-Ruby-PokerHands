class CardParser
  def self.parse(input)
    value = card_value input[0]
    suit = input[1]
    
    if value && Suit.is_valid?(suit)
      return Card.new value, suit
    end
  end
  
  def self.card_value(input)
    case input
    when '2'..'9' then return input.to_i
    when CardFace::TEN then return 10
    when CardFace::JACK then return 11
    when CardFace::QUEEN then return 12
    when CardFace::KING then return 13
    when CardFace::ACE then return 14
    end
  end
end
