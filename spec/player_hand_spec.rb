require 'rspec'

describe TexasHoldem::PlayerHand do

  describe '#initialize' do
    it 'should set best combination' do
      hand = described_class.new([Card.new('As'), Card.new('2c'), Card.new('8d')])
      expect(hand.best_combination).to be_instance_of(TexasHoldem::Combinations::HighestCard)
    end

    it 'should set best combination to nil' do
      hand = described_class.new([])
      expect(hand.best_combination).to be_nil
    end
  end

  describe '#add_cards' do
    let(:hand) {described_class.new([])}

    it 'should add one card' do
      hand.add_cards(Card.new('As'))
      expect(hand.cards).to eq([Card.new('As')])
    end

    it 'should add array of cards' do
      hand.add_cards([Card.new('As'), Card.new('2s')])
      expect(hand.cards).to eq([Card.new('As'), Card.new('2s')])
    end

    it 'should update best combination' do
      hand = described_class.new([Card.new('As')])
      hand.add_cards([Card.new('As'), Card.new('2s')])
      expect(hand.best_combination).to be_instance_of(TexasHoldem::Combinations::Pair)
    end
  end

  describe '#<=>' do
    it 'compares two hands by best combination' do
      hand1 = described_class.new([Card.new('As')])
      hand2 = described_class.new([Card.new('2s'), Card.new('2h')])
      expect(hand2).to be > hand1
    end
  end
end