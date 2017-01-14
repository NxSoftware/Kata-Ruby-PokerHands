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
    when 'T' then return 10
    when 'J' then return 11
    when 'Q' then return 12
    when 'K' then return 13
    when 'A' then return 14
    end
  end
end
