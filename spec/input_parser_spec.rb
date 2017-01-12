RSpec.describe PokerInputParser, '#parse' do
  
  context 'given input with two players' do
    input = 'Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C AH'
    parser = PokerInputParser.new input
    players = parser.players
    
    it 'has 2 players' do
      expect(players.count).to be(2)
    end
    
    it 'each player has 5 cards' do
      players.each do |player|
        expect(player.cards.count).to be(5)
      end
    end
    
    it 'player 1\'s cards are 2H 3D 5S 9C KD' do
      actual_cards = players[0].cards
      expected_cards = ['2H', '3D', '5S', '9C', 'KD']
      expect(actual_cards).to match(expected_cards)
    end
    
  end
  
end
