class Card
  attr_reader :description
  
  def initialize(input)
    @description = input
  end
  
  def ==(other)
    self.class == other.class && @description == other.description
  end
end
