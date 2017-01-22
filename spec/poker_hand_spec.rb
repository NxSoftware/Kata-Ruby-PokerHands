def hand(cards)
  PokerHand.new cards.map { |c| CardParser.parse c }
end

def expect_high_card(expected_value, cards)
  context "given #{cards}" do
    it "the high card is #{expected_value}" do
      hand = hand(cards)
      expect(hand.high_card).to be(expected_value)
    end
  end
end

def expect_pair(expected_value, cards)
  context "given #{cards}" do
    it "the pair's value is #{expected_value}" do
      hand = hand(cards)
      expect(hand.pair).to be(expected_value)
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
      expect(hand.three_of_a_kind).to be(expected_value)
    end
  end
end

def expect_straight(expected_value, cards)
  context "given #{cards}" do
    it "the highest value of the straight is #{expected_value}" do
      hand = hand(cards)
      expect(hand.straight).to be(expected_value)
    end
  end
end

def expect_flush(expected_value, cards)
  context "given #{cards}" do
    it "the highest value of the flush is #{expected_value}" do
      hand = hand(cards)
      expect(hand.flush).to be(expected_value)
    end
  end
end

def expect_full_house(expected_value, cards)
  context "given #{cards}" do
    it "the highest value of the full house is #{expected_value}" do
      hand = hand(cards)
      expect(hand.full_house).to be(expected_value)
    end
  end
end

def expect_four_of_a_kind(expected_value, cards)
  context "given #{cards}" do
    it "the values of the 4OAK is #{expected_value}" do
      hand = hand(cards)
      expect(hand.four_of_a_kind).to be(expected_value)
    end
  end
end

def expect_straight_flush(expected_value, cards)
  context "given #{cards}" do
    it "the highest value of the straight flush is #{expected_value}" do
      hand = hand(cards)
      expect(hand.straight_flush).to be(expected_value)
    end
  end
end

def expect_royal_flush(is_royal_flush, cards)
  context "given #{cards}" do
    msg = is_royal_flush ? 'is a royal flush' : 'not a royal flush'
    it msg do
      hand = hand(cards)
      expect(hand.royal_flush?).to be(is_royal_flush)
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
    expect_straight(nil, ['2H', '3H', '4C', '5H', '7H'])
    expect_straight(6, ['2H', '3H', '4C', '5H', '6H'])
    expect_straight(7, ['3H', '4H', '5C', '6H', '7H'])
    expect_straight(7, ['3H', '4H', '5C', '7H', '6H'])
  end
  
  describe '#flush' do
    expect_flush(nil, [])
    expect_flush(nil, ['2H', '3H', '4H', '5C', '7H'])
    expect_flush(7, ['2H', '3H', '4H', '7H', '5H'])
  end
  
  describe '#full_house' do
    expect_full_house(nil, [])
    expect_full_house(nil, ['2H', '3H', '3C', '3D', '4H'])
    expect_full_house(4, ['2H', '4H', '4C', '4D', '2C'])
  end
  
  describe '#four_of_a_kind' do
    expect_four_of_a_kind(nil, [])
    expect_four_of_a_kind(nil, ['2H', '3H', '4H', '5H', '6H'])
    expect_four_of_a_kind(2, ['2H', '2D', '2C', '2S', '3H'])
  end
  
  describe '#straight_flush' do
    expect_straight_flush(nil, [])
    expect_straight_flush(nil, ['2H', '3H', '4H', '5H', '7H'])
    expect_straight_flush(nil, ['2H', '3H', '4H', '5H', '6S'])
    expect_straight_flush(6, ['2H', '3H', '4H', '5H', '6H'])
    expect_straight_flush(6, ['2H', '3H', '4H', '6H', '5H'])
  end
  
  describe '#royal_flush' do
    expect_royal_flush(false, [])
    expect_royal_flush(false, ['9H', 'JH', 'QH', 'KH', 'AH'])
    expect_royal_flush(false, ['TH', 'JH', 'QH', 'KH', 'AC'])
    expect_royal_flush(true, ['TH', 'JH', 'QH', 'KH', 'AH'])
  end
  
end
