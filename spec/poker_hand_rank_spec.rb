describe PokerHand, '#rank' do
  
  context 'given 2H 3D 4S 5C 6H' do
    it 'rank is high card with 6' do
      hand = PokerHand.new(['2H', '3D', '4S', '5C', '6H'].map do |c|
        CardParser.parse c
      end)

      expect(hand.rank).to eq([:high_card, 6])
    end
  end
  
end
