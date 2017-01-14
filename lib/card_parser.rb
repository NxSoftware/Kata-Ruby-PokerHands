class CardParser
  def self.parse(input)
    value = input[0]
    case value
    when '1'..'10' then value = value.to_i
    when 'J' then value = 11
    end
    
    Card.new value, input[1]
  end
end
