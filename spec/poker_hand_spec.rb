describe PokerHand, '#high_card' do
  
  context 'given 2H 3H 4H 5H 6H' do
    it '6H is the high card' do
      cards = [
        CardParser.parse('2H'),
        CardParser.parse('3H'),
        CardParser.parse('4H'),
        CardParser.parse('5H'),
        CardParser.parse('6H'),
      ]
      hand = PokerHand.new cards
      expect(hand.high_card).to eq(cards.last)
    end
  end
  
  context 'given 6H 2H 3H 4H 5H' do
    it '6H is the high card' do
      cards = [
        CardParser.parse('6H'),
        CardParser.parse('2H'),
        CardParser.parse('3H'),
        CardParser.parse('4H'),
        CardParser.parse('5H'),
      ]
      hand = PokerHand.new cards
      expect(hand.high_card).to eq(cards.first)
    end
  end
  
end
