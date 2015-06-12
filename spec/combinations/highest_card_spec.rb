require 'rspec'

describe TexasHoldem::Combinations::HighestCard do

  Card = TexasHoldem::Card
  HighestCard = TexasHoldem::Combinations::HighestCard

  describe '#initialize' do
    context 'when cards has a pair' do
      let(:set1) {[ Card.new('Js'), Card.new('Ad'), Card.new('Qh') ]}

      it 'sets combination cards' do
        combination_cards = HighestCard.new(set1).combination_cards.map(&:to_s)
        expect(combination_cards). to eq(['A♦'])
      end

      it 'sets kicker cards' do
        kicker_cards = HighestCard.new(set1).kicker_cards.map(&:to_s)
        expect(kicker_cards). to eq(['Q♥', 'J♠'])
      end
    end
  end

  describe 'comparing with another highest card' do
    let(:highest1) { HighestCard.new([Card.new('As'), Card.new('2c')]) }
    let(:highest2) { HighestCard.new([Card.new('2s'), Card.new('2c'), Card.new('3c')]) }
    let(:highest3) { HighestCard.new([Card.new('2h'), Card.new('2d'), Card.new('3h')]) }

    it 'compares pairs' do
      expect(highest1).to be > highest2
      expect(highest2).to eq highest3
    end
  end

end