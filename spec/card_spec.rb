require 'rspec'

describe TexasHoldem::Card do
  
  it 'builds a set 52 cards' do
    expect(TexasHoldem::Card.build_all.length).to eq(52)
  end

  it 'includes Comparable' do
    expect(TexasHoldem::Card.ancestors).to include(Comparable)
  end

  describe '#initialize' do
    context 'when arguments are valid' do
      before :each do
        @card1 = TexasHoldem::Card.new('10c')
        @card2 = TexasHoldem::Card.new('2h')
        @card3 = TexasHoldem::Card.new('Jd')
      end

      it 'parses suit' do
        expect(@card1.suit).to eq('c')
        expect(@card2.suit).to eq('h')
        expect(@card3.suit).to eq('d')
      end

      it 'parses rank' do
        expect(@card1.rank).to eq('10')
        expect(@card2.rank).to eq('2')
        expect(@card3.rank).to eq('J')
      end
    end

    context 'when arguments are invalid' do
      it 'returns an error if suit is invalid' do
        expect { TexasHoldem::Card.new('Qk') }.to raise_error ArgumentError
      end

      it 'returns an error if rank is invalid' do
        expect { TexasHoldem::Card.new('Ih') }.to raise_error ArgumentError
      end
    end
  end

  describe '#is_face_card?' do
    it 'returns true' do
      expect(TexasHoldem::Card.new('As').is_face_card?).to eq(true)
    end

    it 'returns false' do
      expect(TexasHoldem::Card.new('5d').is_face_card?).to eq(false)
    end
  end

  describe '#to_s' do
    it 'returns string representation of card' do
      expect(TexasHoldem::Card.new('Qs').to_s).to eq('Q♠')
      expect(TexasHoldem::Card.new('Ad').to_s).to eq('A♦')
      expect(TexasHoldem::Card.new('10c').to_s).to eq('10♣')
      expect(TexasHoldem::Card.new('9h').to_s).to eq('9♥')
    end
  end

  describe '#<=>' do
    it 'compares two cards' do
      expect(TexasHoldem::Card.new('Qs')).to eq TexasHoldem::Card.new('Qc')
      expect(TexasHoldem::Card.new('Qs')).to be > TexasHoldem::Card.new('2d')
      expect(TexasHoldem::Card.new('Qs')).to be < TexasHoldem::Card.new('Kh')
    end
  end
end