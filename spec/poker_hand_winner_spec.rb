def winner_of(cards1, cards2)
  hand1 = make_hand cards1
  hand2 = make_hand cards2
  
  PokerHandWinner.winner hand1, hand2
end

RSpec::Matchers.define :win_with do |expected_winning_rank, expected_winning_value|
  match do |actual_winner|
    actual_rank = actual_winner.hand.rank
    actual_winning_rank = actual_rank[0]
    actual_winning_value = actual_rank[1]
    
    actual_winning_rank == expected_winning_rank &&
    actual_winning_value == expected_winning_value
  end
  
  failure_message do |actual_winner|
    "expected to win with rank of [#{expected_winning_rank}, #{expected_winning_value}] actual: #{actual_winner}"
  end
end

describe PokerHandWinner, '#winner' do
  
  context 'given no hands' do
    it 'there is no winner' do
      winner = PokerHandWinner.winner(nil, nil)
      expect(winner).to be_nil
    end
  end
  
  context 'given empty hands' do
    it 'there is no winner' do
      winner = PokerHandWinner.winner([], [])
      expect(winner).to be_nil
    end
  end
  
  context 'given 2H 3D 4S 5C 7H and 2C 3C 4H 5D 8S' do
    it '2nd hand wins with high card of 8' do
      cards1 = ['2H', '3D', '4S', '5C', '7H']
      cards2 = ['2C', '3C', '4H', '5D', '8S']
      expect(winner_of cards1, cards2).to win_with(:high_card, 8)
    end
  end
  
  context 'given 2H 3D 2S 5C 7H and 2C 3C 4H 5D 8S' do
    it '1st hand wins with pair of 2s' do
      cards1 = ['2H', '3D', '2S', '5C', '7H']
      cards2 = ['2C', '3C', '4H', '5D', '8S']
      expect(winner_of cards1, cards2).to win_with(:pair, 2)
    end
  end
  
  context 'given 2H 3D 2S 5C 7H and 2C 3C 4H 3H 8S' do
    it '2nd hand wins with pair of 3s' do
      cards1 = ['2H', '3D', '2S', '5C', '7H']
      cards2 = ['2C', '3C', '4H', '3H', '8S']
      expect(winner_of cards1, cards2).to win_with(:pair, 3)
    end
  end
  
  context 'given 2H 3D 2S 3C 7H and 2C 3S 4H 3H 8S' do
    it '1st hand wins with two pair (2s and 3s)' do
      cards1 = ['2H', '3D', '2S', '3C', '7H']
      cards2 = ['2C', '3S', '4H', '3H', '8S']
      expect(winner_of cards1, cards2).to win_with(:two_pair, [2, 3])
    end
  end
  
  context 'given 2H 3D 2S 3C 7H and 2C 4S 4H 3H 2D' do
    it '2nd hand wins with two pair (2s and 4s)' do
      cards1 = ['2H', '3D', '2S', '3C', '7H']
      cards2 = ['2C', '4S', '4H', '3H', '2D']
      expect(winner_of cards1, cards2).to win_with(:two_pair, [2, 4])
    end
  end
  
  context 'given 2H 3D 2S 4C 2D and 2C 4S 4H 3H 3S' do
    it '1st hand wins with 3 of a kind of 2s' do
      cards1 = ['2H', '3D', '2S', '4C', '2D']
      cards2 = ['2C', '4S', '4H', '3H', '3D']
      expect(winner_of cards1, cards2).to win_with(:three_of_a_kind, 2)
    end
  end
  
  context 'given 2H 3C 2S 4D 2D and 2C 3S 3H 4C 3D' do
    it '2nd hand wins with 3 of a kind of 3s' do
      cards1 = ['2H', '3C', '2S', '4D', '2D']
      cards2 = ['2C', '3S', '3H', '4C', '3D']
      expect(winner_of cards1, cards2).to win_with(:three_of_a_kind, 3)
    end
  end
  
  context 'given 2H 3C 4S 5D 6D and 2C 3S 3H 4C 3D' do
    it '1st hand wins with a straight, highest card being 6' do
      cards1 = ['2H', '3C', '4S', '5D', '6D']
      cards2 = ['2C', '3S', '3H', '4C', '3D']
      expect(winner_of cards1, cards2).to win_with(:straight, 6)
    end
  end
  
  context 'given 2H 3C 4S 5D 6D and 3S 4H 5C 6S 7H' do
    it '2nd hand wins with a higher straight, highest card being 7' do
      cards1 = ['2H', '3C', '4S', '5D', '6D']
      cards2 = ['3S', '4H', '5C', '6S', '7H']
      expect(winner_of cards1, cards2).to win_with(:straight, 7)
    end
  end
  
  context 'given 2H 4H 6H 8H TH and 3S 4H 5C 6S 7H' do
    it '1st hand wins with a flush, highest card being 10' do
      cards1 = ['2H', '4H', '6H', '8H', 'TH']
      cards2 = ['3S', '4H', '5C', '6S', '7H']
      expect(winner_of cards1, cards2).to win_with(:flush, 10)
    end
  end
  
  context 'given 2H 4H 6H 8H TH and 2C 4C 6C 8C JC' do
    it '2nd hand wins with a higher flush, highest card being Jack' do
      cards1 = ['2H', '4H', '6H', '8H', 'TH']
      cards2 = ['2C', '4C', '6C', '8C', 'JC']
      expect(winner_of cards1, cards2).to win_with(:flush, 11)
    end
  end
  
  context 'given 2H 3C 3H 3D 2S and 2C 4C 6C 8C JC' do
    it '1st hand wins with a full house of 3s' do
      cards1 = ['2H', '3C', '3H', '3D', '2S']
      cards2 = ['2C', '4C', '6C', '8C', 'JC']
      expect(winner_of cards1, cards2).to win_with(:full_house, 3)
    end
  end
  
  context 'given 2H 3C 3H 3D 2S and 2D 4C 4H 4D 2H' do
    it '2nd hand wins with a higher full house of 4s' do
      cards1 = ['2H', '3C', '3H', '3D', '2S']
      cards2 = ['2D', '4C', '4H', '4D', '2H']
      expect(winner_of cards1, cards2).to win_with(:full_house, 4)
    end
  end
  
  context 'given 2H 3C 3H 3D 3S and 2D 4C 4H 4D 2H' do
    it '1st hand wins with 4 of a kind of 3s' do
      cards1 = ['2H', '3C', '3H', '3D', '3S']
      cards2 = ['2D', '4C', '4H', '4D', '2H']
      expect(winner_of cards1, cards2).to win_with(:four_of_a_kind, 3)
    end
  end
  
  context 'given 2H 3C 3H 3D 3S and 2D 4C 4H 4D 4S' do
    it '2nd hand wins with higher 4 of a kind of 4s' do
      cards1 = ['2H', '3C', '3H', '3D', '3S']
      cards2 = ['2D', '4C', '4H', '4D', '4S']
      expect(winner_of cards1, cards2).to win_with(:four_of_a_kind, 4)
    end
  end
  
  context 'given 2H 3H 4H 5H 6H and 2D 4C 4H 4D 4S' do
    it '1st hand wins with a straight flush, highest card being 6' do
      cards1 = ['2H', '3H', '4H', '5H', '6H']
      cards2 = ['2D', '4C', '4H', '4D', '4S']
      expect(winner_of cards1, cards2).to win_with(:straight_flush, 6)
    end
  end
  
end
