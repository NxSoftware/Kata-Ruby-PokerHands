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
    Card.new(value, suit) if Suit.is_valid?(suit)
  end
end
