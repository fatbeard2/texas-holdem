require 'rspec'

describe TexasHoldem::Combinations::HighestCard do

  include_examples 'initialising with empty array'

  context 'when combination is present' do
    include_examples 'setting combination info' do
      let(:cards) {[ Card.new('Jh'), Card.new('Ad'), Card.new('Qc') ]}
      let(:combination_cards) {['A♦']}
      let(:kicker_cards) {['Q♣','J♥']}
    end
  end

  include_examples '#has_combination?' do
    let(:cards_with_combination) {[ Card.new('Ad'), Card.new('As'), Card.new('6h') ]}
    let(:cards_without_combination) {[]}
  end

  include_examples 'comparing' do
    let(:strongest_combination) { [Card.new('As'), Card.new('Qc')] }
    let(:middle_combination1)  { [Card.new('2s'), Card.new('10d')] }
    let(:middle_combination2) { [Card.new('2h'), Card.new('10h')] }
    let(:weakest_combination) { [Card.new('2s'), Card.new('3c')] }
  end

end