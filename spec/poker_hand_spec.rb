def hand(cards)
  PokerHand.new cards.map { |c| CardParser.parse c }
end

def expect_high_card(expected_value, cards)
  context "given #{cards}" do
    it "the high card is #{expected_value}" do
      hand = hand(cards)
      expect(hand.high_card).to eq(expected_value)
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

def expect_three_of_a_kind(expected_value, cards)
  context "given #{cards}" do
    it "the values of the 3OAK is #{expected_value}" do
      hand = hand(cards)
      expect(hand.three_of_a_kind).to match(expected_value)
    end
  end
end

def expect_straight(expected_highest_value, cards)
  context "given #{cards}" do
    it "the highest value of the straight is #{expected_highest_value}" do
      hand = hand(cards)
      expect(hand.straight).to match(expected_highest_value)
    end
  end
end

describe PokerHand do
  describe '#high_card' do
    expect_high_card(nil, [])
    expect_high_card(6, ['2H', '3H', '4H', '5H', '6H'])
    expect_high_card(6, ['6H', '2H', '3H', '4H', '5H'])
    expect_high_card(10, ['9C', 'TH', '8S', '2D', '5H'])
    expect_high_card(11, ['9C', 'TH', 'JH', '2D', '5H'])
    expect_high_card(12, ['QC', 'TH', 'JH', '2D', '5H'])
    expect_high_card(13, ['QC', 'TH', 'JH', 'KC', '5H'])
  end

  describe '#pair' do
    expect_pair(nil, [])
    expect_pair(nil, ['2H', '3C', '4H', '5H', '6H'])
    expect_pair(2, ['2H', '4H', '2C', '5H', '6H'])
    expect_pair(3, ['2H', '3C', '3H', '5H', '6H'])
  end
  
  describe '#two_pair' do
    expect_two_pair(nil, [])
    expect_two_pair(nil, ['2H', '3C', '4H', '5H', '6H'])
    expect_two_pair([2, 3], ['2H', '3C', '2S', '4D', '3D'])
    expect_two_pair([9, 10], ['TH', 'TD', '9C', '4C', '9H'])
  end
  
  describe '#three_of_a_kind' do
    expect_three_of_a_kind(nil, [])
    expect_three_of_a_kind(nil, ['2H', '3H', '4H', '5H', '6H'])
    expect_three_of_a_kind(2, ['2H', '3C', '2S', '4D', '2C'])
    expect_three_of_a_kind(3, ['3H', '3C', '3S', '4D', '5C'])
  end
  
  describe '#straight' do
    expect_straight(nil, [])
    expect_straight(6, ['2H', '3H', '4H', '5H', '6H'])
  end
  
end
