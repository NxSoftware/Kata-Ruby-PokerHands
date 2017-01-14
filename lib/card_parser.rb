class CardParser
  def self.parse(input)
    value = input[0]
    case value
    when '1'..'10' then value = value.to_i
    when 'J' then value = 11
    when 'Q' then value = 12
    when 'K' then value = 13
    when 'A' then value = 14
    end
    
    Card.new value, input[1]
  end
end
