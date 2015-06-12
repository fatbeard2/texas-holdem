require 'rspec'
require 'byebug'
describe TexasHoldem::Combinations::Combination do

  Card = TexasHoldem::Card
  #we can take any Combination subclass to create instances
  Combination = TexasHoldem::Combinations::HighestCard

  describe '#update_combination' do
    let(:combination) { Combination.new([Card.new('Ah'), Card.new('2s'), Card.new('5h'), Card.new('5s')])}

    it 'sets cards_by_rank' do
      expected = {
          'A' => [Card.new('Ah')],
          '2' => [Card.new('2s')],
          '5' => [Card.new('5h'), Card.new('5s')]
      }
      expect(combination.cards_by_rank).to eq(expected)
    end

    it 'sets cards_by_suite' do
      expected = { 'h' => [Card.new('Ah'), Card.new('5h')], 's' => [Card.new('2s'), Card.new('5s')] }
      expect(combination.cards_by_suit).to eq(expected)
    end

  end

  describe '#add_to_hand' do
    let (:combination) { Combination.new([])}

    it 'adds one card' do
      combination.add_to_hand(Card.new('As'))
      expect(combination.cards).to eq([Card.new('As')])
    end

    it 'adds array of cards' do
      combination.add_to_hand([Card.new('As'), Card.new('Ac')])
      expect(combination.cards).to eq([Card.new('As'), Card.new('Ac')])
    end

    it 'sends update_combination message' do
      allow(combination).to receive(:update_combination)
      combination.add_to_hand(Card.new('As'))
      expect(combination).to have_received(:update_combination)
    end
  end

  describe '#<=>' do

    let(:highest) { TexasHoldem::Combinations::HighestCard.new([Card.new('As')]) }
    let(:pair){ TexasHoldem::Combinations::Pair.new([Card.new('As'), Card.new('Ac')]) }

    it 'compares combinations by rank' do
      #todo add more compares
      expect(pair).to be > highest
    end
    it 'compares combinations by calling #compare_same_rank' do
      allow(highest).to receive(:compare_same_rank)
      highest <=> highest
      expect(highest).to receive(:compare_same_rank)
    end

    it 'compares combinations by kickers'
  end

  describe '#compare_kickers' do
    it 'compares two set of kickers'
  end
end