class CardParser
  def self.parse(input)
    Card.new input[0].to_i, input[1]
  end
end
