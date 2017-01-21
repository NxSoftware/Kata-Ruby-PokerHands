def make_hand(cards)
  PokerHand.new(cards.map do |c|
    CardParser.parse c
  end)
end
