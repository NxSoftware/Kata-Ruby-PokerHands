RSpec::Matchers.define :beat do |expected_losing_cards, expected_winning_rank|
  match do |expected_winning_cards|
    expected_winning_hand = make_hand expected_winning_cards
    expected_losing_hand = make_hand expected_losing_cards
    
    winner = PokerHandWinner.winner(expected_winning_hand, expected_losing_hand)
    
    return false unless winner
    
    winner.hand == expected_winning_hand
  end
  
  failure_message do |expected_winning_cards|
    "expected #{expected_winning_cards} to beat #{expected_losing_cards} with rank of #{expected_winning_rank}"
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
      expect(cards2).to beat(cards1, [:high_card, 8])
    end
  end
  
end
