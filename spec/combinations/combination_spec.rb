require 'rspec'

describe TexasHoldem::Combinations::Combination do

  describe '#<=>' do

    let(:highest1) { TexasHoldem::Combinations::HighestCard.new([Card.new('As'), Card.new('Jh'), Card.new('3c')]) }
    let(:highest2) { TexasHoldem::Combinations::HighestCard.new([Card.new('Ah'), Card.new('2d'), Card.new('Js')]) }
    let(:highest3) { TexasHoldem::Combinations::HighestCard.new([Card.new('3d'), Card.new('Js'), Card.new('Ac')]) }
    let(:pair){ TexasHoldem::Combinations::Pair.new([Card.new('As'), Card.new('Ac')]) }

    it 'compares combinations by rank' do
      #todo add more compares
      expect(pair).to be > highest1
    end

    it 'compares combinations by kickers' do
      expect(highest1).to be > highest2
      expect(highest1).to eq(highest3)
    end
  end

end