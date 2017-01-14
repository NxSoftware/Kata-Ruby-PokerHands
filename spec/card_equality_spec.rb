describe Card, '#==' do
  
  context 'given 3H and 3H' do
    it 'cards are equal' do
      card1 = CardParser.parse '3H'
      card2 = CardParser.parse '3H'
      expect(card1).to eq(card2)
    end
  end
  
  context 'given 3H and 3S' do
    it 'cards are not equal' do
      card1 = CardParser.parse '3H'
      card2 = CardParser.parse '3S'
      expect(card1).not_to eq(card2)
    end
  end
  
  context 'given 3H and 4H' do
    it 'cards are not equal' do
      card1 = CardParser.parse '3H'
      card2 = CardParser.parse '4H'
      expect(card1).not_to eq(card2)
    end
  end
  
end
