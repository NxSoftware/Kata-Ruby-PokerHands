describe CardParser, '#parse' do
  
  context 'given 2H' do
    it 'creates a card as 2 of Hearts' do
      card = CardParser.parse '2H'
      expect(card.value).to eq(2)
      expect(card.suit).to eq(Suit::HEARTS)
    end
  end
  
  context 'given 2D' do
    it 'creates a card as 2 of Diamonds' do
      card = CardParser.parse '2D'
      expect(card.value).to eq(2)
      expect(card.suit).to eq(Suit::DIAMONDS)
    end
  end
  
  context 'given 2C' do
    it 'creates a card as 2 of Clubs' do
      card = CardParser.parse '2C'
      expect(card.value).to eq(2)
      expect(card.suit).to eq(Suit::CLUBS)
    end
  end
  
  context 'given 2S' do
    it 'creates a card as 2 of Spades' do
      card = CardParser.parse '2S'
      expect(card.value).to eq(2)
      expect(card.suit).to eq(Suit::SPADES)
    end
  end
  
end
