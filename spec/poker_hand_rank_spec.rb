describe PokerHand, '#rank' do
  
  context 'given 2H 3D 4S 5C 6H' do
    it 'rank is high card with 6' do
      hand = PokerHand.new(['2H', '3D', '4S', '5C', '6H'].map do |c|
        CardParser.parse c
      end)

      expect(hand.rank).to eq([:high_card, 6])
    end
  end
  
  context 'given 2H 3D 2S 5C 6H' do
    it "rank is pair of 2's" do
      hand = PokerHand.new(['2H', '3D', '2S', '5C', '6H'].map do |c|
        CardParser.parse c
      end)

      expect(hand.rank).to eq([:pair, 2])
    end
  end
  
  context 'given 2H 3D 2S 3C 6H' do
    it "rank is two pair of 2's and 3's" do
      hand = PokerHand.new(['2H', '3D', '2S', '3C', '6H'].map do |c|
        CardParser.parse c
      end)

      expect(hand.rank).to eq([:two_pair, [2, 3]])
    end
  end
  
end