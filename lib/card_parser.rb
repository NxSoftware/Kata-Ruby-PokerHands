class CardParser
  def self.parse(input)
    value = input[0]
    case value
    when '2'..'9' then value = value.to_i
    when 'T' then value = 10
    when 'J' then value = 11
    when 'Q' then value = 12
    when 'K' then value = 13
    when 'A' then value = 14
    else return nil
    end
    
    suit = input[1]
    
    return nil unless [
      Suit::HEARTS,
      Suit::DIAMONDS,
      Suit::CLUBS,
      Suit::SPADES
    ].include? suit
    
    Card.new value, suit
  end
end
