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
    'JH' => {
      :value => 11,
      :suit => Suit::HEARTS
    },
    'QH' => {
      :value => 12,
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
  
end