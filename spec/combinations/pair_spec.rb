require 'rspec'

describe TexasHoldem::Combinations::Pair do

  Card = TexasHoldem::Card
  Pair = TexasHoldem::Combinations::Pair

  describe '#initialize' do
    context 'when cards has a pair' do
      let(:set_with_pair) {[ Card.new('Jh'), Card.new('Ad'), Card.new('Qs'), Card.new('3c'),
                             Card.new('4d'),  Card.new('Js'), Card.new('6h') ]}

      it 'sets combination cards' do
        combination_cards = Pair.new(set_with_pair).combination_cards.map(&:to_s)
        expect(combination_cards). to eq(['J♥', 'J♠'])
      end

      it 'sets kicker cards' do
        kicker_cards = Pair.new(set_with_pair).kicker_cards.map(&:to_s)
        expect(kicker_cards). to eq(['A♦', 'Q♠', '6♥'])
      end
    end

    context 'when cards has two pairs' do
      let(:set_with_two_pairs) {[ Card.new('Jh'), Card.new('Ad'), Card.new('As'), Card.new('3c'),
                             Card.new('4d'),  Card.new('Js'), Card.new('6h') ]}

      it 'takes higher cards for combination' do
        combination_cards = Pair.new(set_with_two_pairs).combination_cards.map(&:to_s)
        expect(combination_cards). to eq(['A♦', 'A♠'])
      end

      it 'sets kicker cards' do
        kicker_cards = Pair.new(set_with_two_pairs).kicker_cards.map(&:to_s)
        expect(kicker_cards). to eq(['J♥', 'J♠', '6♥'])
      end
    end

    context 'when there are no pairs' do
      let(:set_without_pair) {[Card.new('Jh'), Card.new('Ad'), Card.new('6s')]}

      it 'sets combination cards to an empty array' do
        expect(Pair.new(set_without_pair).combination_cards).to be_empty
      end
    end
  end

  describe 'comparing with another pair' do
    let(:pair1) { Pair.new([Card.new('As'), Card.new('Ac')]) }
    let(:pair2) { Pair.new([Card.new('2s'), Card.new('2c'), Card.new('3c')]) }
    let(:pair3) { Pair.new([Card.new('2h'), Card.new('2d'), Card.new('10h')]) }
    let(:pair4) { Pair.new([Card.new('2s'), Card.new('2c'), Card.new('10d')]) }

    it 'compares pairs' do
      expect(pair1).to be > pair2
      expect(pair2).to be < pair3
      expect(pair4).to eq pair4
    end
  end

end