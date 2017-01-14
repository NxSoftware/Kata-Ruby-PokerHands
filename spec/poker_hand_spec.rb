def expect_high_card(expected_high_card, cards)
  context "given #{cards}" do
    it "the high card is #{expected_high_card}" do
      cards = cards.map { |c| CardParser.parse c }
      expected_high_card = CardParser.parse expected_high_card
      hand = PokerHand.new cards
      expect(hand.high_card).to eq(expected_high_card)
    end
  end
end

describe PokerHand, '#high_card' do

  expect_high_card('6H', ['2H', '3H', '4H', '5H', '6H'])
  expect_high_card('6H', ['6H', '2H', '3H', '4H', '5H'])
  expect_high_card('TH', ['9C', 'TH', '8S', '2D', '5H'])
  expect_high_card('JH', ['9C', 'TH', 'JH', '2D', '5H'])
  expect_high_card('QC', ['QC', 'TH', 'JH', '2D', '5H'])
  expect_high_card('KC', ['QC', 'TH', 'JH', 'KC', '5H'])
  
end
