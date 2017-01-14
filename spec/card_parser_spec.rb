describe CardParser, '#parse' do
  
  inputs = {
    '2H' => {
      :value => 2,
      :suit => Suit::HEARTS
    },
    '2D' => {
      :value => 2,
      :suit => Suit::DIAMONDS
    },
    '2C' => {
      :value => 2,
      :suit => Suit::CLUBS
    },
    '2S' => {
      :value => 2,
      :suit => Suit::SPADES
    },
    'TH' => {
      :value => 10,
      :suit => Suit::HEARTS
    },
    'JH' => {
      :value => 11,
      :suit => Suit::HEARTS
    },
    'QH' => {
      :value => 12,
      :suit => Suit::HEARTS
    },
    'KH' => {
      :value => 13,
      :suit => Suit::HEARTS
    },
    'AH' => {
      :value => 14,
      :suit => Suit::HEARTS
    },
  }
  
  inputs.each do |input, v|
    context "given #{input}" do
      it "creates a valid card" do
        card = CardParser.parse input
        expect(card.value).to eq(v[:value])
        expect(card.suit).to eq(v[:suit])
      end
    end
  end
  
  context 'given invalid input value BH' do
    it 'does not create a card' do
      card = CardParser.parse 'BH'
      expect(card).to be_nil
    end
  end
  
  context 'given invalid input value 1H' do
    it 'does not create a card' do
      card = CardParser.parse '1H'
      expect(card).to be_nil
    end
  end
  
  context 'given invalid input suit 9M' do
    it 'does not create a card' do
      card = CardParser.parse '9M'
      expect(card).to be_nil
    end
  end
  
end
