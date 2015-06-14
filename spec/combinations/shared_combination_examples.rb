require 'rspec'

RSpec.shared_examples 'setting combination info' do
  describe 'setting combination an kicker cards' do
    it 'sets combination cards' do
      comb_cards = described_class.new(cards).combination_cards.map(&:to_s)
      expect(comb_cards). to eq(combination_cards)
    end

    it 'sets kicker cards' do
      kick_cards = described_class.new(cards).kicker_cards.map(&:to_s)
      expect(kick_cards). to eq(kicker_cards)
    end
  end
end

RSpec.shared_examples 'initialising with empty array' do
  describe 'initialising with empty array of cards' do
    it 'sets combination cards to an empty array' do
      expect(described_class.new([]).combination_cards).to be_empty
    end
  end

end

RSpec.shared_examples '#has_combination?' do
  describe '#has_combination?' do
    it 'returns true when combination is present' do
      expect(described_class.new(cards_with_combination)).to have_combination
    end

    it 'returns false when there is no combination' do
      expect(described_class.new(cards_without_combination)).to_not have_combination
    end
  end
end

RSpec.shared_examples 'comparing' do
  describe 'comparing combination of same type' do
    it 'compares combinations' do
      expect(described_class.new(strongest_combination)).to be > described_class.new(weakest_combination)
      expect(described_class.new(middle_combination1)).to be < described_class.new(strongest_combination)
      expect(described_class.new(middle_combination1)).to eq described_class.new(middle_combination2)
    end
  end
end

