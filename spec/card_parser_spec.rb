describe CardParser, '#parse' do
  
  context 'given 2H' do
    it 'creates a card as 2 of Hearts' do
      card = CardParser.parse '2H'
      expect(card.value).to eq(2)
      expect(card.suit).to eq(Suit::HEARTS)
    end
  end
  
end
