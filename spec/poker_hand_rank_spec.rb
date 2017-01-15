def expect_rank(cards, &matcher)
  hand = make_hand cards
  expect(hand.rank)
end
  
def make_hand(cards)
  PokerHand.new(cards.map do |c|
    CardParser.parse c
  end)
end

describe PokerHand, '#rank' do
  
  context 'given 2H 3D 4S 5C 6H' do
    it 'rank is high card with 7' do
      cards = ['2H', '3D', '4S', '5C', '7H']
      expect_rank(cards).to eq([:high_card, 7])
    end
  end
  
  context 'given 2H 3D 2S 5C 6H' do
    it "rank is pair of 2's" do
      cards = ['2H', '3D', '2S', '5C', '6H']
      expect_rank(cards).to eq([:pair, 2])
    end
  end
  
  context 'given 2H 3D 2S 3C 6H' do
    it "rank is two pair of 2's and 3's" do
      cards = ['2H', '3D', '2S', '3C', '6H']
      expect_rank(cards).to eq([:two_pair, [2, 3]])
    end
  end
  
  context 'given 2H 2D 2S 3C 6H' do
    it "rank is three of a kind of 2's" do
      cards = ['2H', '2D', '2S', '3C', '6H']
      expect_rank(cards).to eq([:three_of_a_kind, 2])
    end
  end
  
  context 'given 2H 3D 4S 5C 6H' do
    it "rank is straight, high card being 6" do
      cards = ['2H', '3D', '4S', '5C', '6H']
      expect_rank(cards).to eq([:straight, 6])
    end
  end
  
  context 'given 2H 3H 4H 5H 7H' do
    it "rank is flush, high card being 7" do
      cards = ['2H', '3H', '4H', '5H', '7H']
      expect_rank(cards).to eq([:flush, 7])
    end
  end
  
end
