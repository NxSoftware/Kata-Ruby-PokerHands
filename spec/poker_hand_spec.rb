def hand(cards)
  PokerHand.new cards.map { |c| CardParser.parse c }
end

def expect_high_card(expected_high_card, cards)
  context "given #{cards}" do
    it "the high card is #{expected_high_card}" do
      expected_high_card = CardParser.parse expected_high_card
      hand = hand(cards)
      expect(hand.high_card).to eq(expected_high_card)
    end
  end
end

def expect_pair(expected_value, cards)
  context "given #{cards}" do
    it "the pair's value is #{expected_value}" do
      hand = hand(cards)
      expect(hand.pair).to match(expected_value)
    end
  end
end

def expect_two_pair(expected_pair, cards)
  context "given #{cards}" do
    it "the values of the two pairs are #{expected_pair}" do
      hand = hand(cards)
      expect(hand.two_pair).to match(expected_pair)
    end
  end
end

describe PokerHand do
  describe '#high_card' do
    expect_high_card('6H', ['2H', '3H', '4H', '5H', '6H'])
    expect_high_card('6H', ['6H', '2H', '3H', '4H', '5H'])
    expect_high_card('TH', ['9C', 'TH', '8S', '2D', '5H'])
    expect_high_card('JH', ['9C', 'TH', 'JH', '2D', '5H'])
    expect_high_card('QC', ['QC', 'TH', 'JH', '2D', '5H'])
    expect_high_card('KC', ['QC', 'TH', 'JH', 'KC', '5H'])
  end

  describe '#pair' do
    expect_pair(2, ['2H', '4H', '2C', '5H', '6H'])
    expect_pair(3, ['2H', '3C', '3H', '5H', '6H'])
    expect_pair(nil, ['2H', '3C', '4H', '5H', '6H'])
  end
  
  describe '#two_pair' do
    expect_two_pair([2, 3], ['2H', '3C', '2S', '4D', '3D'])
  end
  
end
