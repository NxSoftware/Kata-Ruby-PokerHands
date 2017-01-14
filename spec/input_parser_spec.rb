RSpec.describe PokerInputParser, '#parse' do
  
  context 'given input with two players' do
    input = 'Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C AH'
    parser = PokerInputParser.new input
    players = parser.players
    
    it 'has 2 players' do
      expect(players.count).to eq(2)
    end
    
    it 'each player has 5 cards' do
      players.each do |player|
        expect(player.cards.count).to eq(5)
      end
    end
    
    it 'player 1\'s cards are 2H 3D 5S 9C KD' do
      expected_cards = ['2H', '3D', '5S', '9C', 'KD']
      expect(players[0].cards).to match(expected_cards)
    end
    
    it 'player 2\'s cards are 2C 3H 4S 8C AH' do
      expected_cards = ['2C', '3H', '4S', '8C', 'AH']
      expect(players[1].cards).to match(expected_cards)
    end
    
  end
  
  context 'given input with three players' do
    input = 'Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C AH  Orange: 3D 4C 8H AS JD'
    parser = PokerInputParser.new input
    players = parser.players
    
    it 'has 3 players' do
      expect(players.count).to eq(3)
    end
    
  end
  
end
