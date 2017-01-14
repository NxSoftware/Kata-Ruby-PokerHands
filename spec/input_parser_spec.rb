RSpec.describe PokerInputParser, '#parse' do
  
  shared_examples_for PokerInputParser do |players_expected_cards|
    before(:each) do
      parser = PokerInputParser.new subject
      @players = parser.players
    end
    
    it "has #{players_expected_cards.count} players" do
      expect(@players.count).to eq(players_expected_cards.count)
    end
    
    it 'each player has 5 cards' do
      @players.each do |player|
        expect(player.cards.count).to eq(5)
      end
    end
    
    players_expected_cards.each.with_index do |expected_cards, i|
      it "player #{i+1}\'s cards are #{expected_cards}" do
        actual_cards = @players[i].cards
        
        expected_cards.each.with_index do |c, card_index|
          expect(actual_cards[card_index]).to match(CardParser.parse c)
        end
      end
    end
  end
  
  context 'given input with two players' do
    subject { 
      'Black: 2H 3D 5S 9C KD  White: 2C 3H 4S 8C AH'
    }
    
    it_should_behave_like PokerInputParser, [
      ['2H', '3D', '5S', '9C', 'KD'],
      ['2C', '3H', '4S', '8C', 'AH'],
    ]
    
  end
  
  context 'given input with three players' do
    subject {
      'Black: 3H AD 6C 8C QD  White: 8D 3S 5S 9C AH  Orange: 3D 4C 8H AS JD'
    }
    
    it_should_behave_like PokerInputParser, [
      ['3H', 'AD', '6C', '8C', 'QD'],
      ['8D', '3S', '5S', '9C', 'AH'],
      ['3D', '4C', '8H', 'AS', 'JD'],
    ]
  end
  
end
