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
  
end
