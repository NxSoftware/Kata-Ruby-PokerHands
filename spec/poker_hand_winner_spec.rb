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
  
end
