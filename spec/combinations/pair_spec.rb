require 'rspec'

describe TexasHoldem::Combinations::Pair do

  include_examples 'initialising with empty array'

  context 'when combination is present' do
    include_examples 'setting combination info' do
      let(:cards) {[ Card.new('Jh'), Card.new('Ad'), Card.new('Qs'), Card.new('3c'),
                     Card.new('4d'),  Card.new('Js'), Card.new('6h') ]}
      let(:kicker_cards) {['A♦', 'Q♠', '6♥']}
      let(:combination_cards) {['J♥', 'J♠']}
    end
  end

  context 'when there are no pairs' do
    include_examples 'setting combination info' do
      let(:cards) {[Card.new('Jh'), Card.new('Ad'), Card.new('6s')]}
      let(:kicker_cards) {['A♦', 'J♥', '6♠']}
      let(:combination_cards) {[]}
    end
  end

  include_examples '#has_combination?' do
    let(:cards_with_combination) {[ Card.new('Ad'), Card.new('As'), Card.new('6h') ]}
    let(:cards_without_combination) {[Card.new('Jh'), Card.new('Ad'), Card.new('6s')]}
  end

  include_examples 'comparing' do
    let(:strongest_combination) { [Card.new('As'), Card.new('Ac')] }
    let(:middle_combination1)  { [Card.new('2s'), Card.new('2c'), Card.new('10d')] }
    let(:middle_combination2) { [Card.new('2h'), Card.new('2d'), Card.new('10h')] }
    let(:weakest_combination) { [Card.new('2s'), Card.new('2c'), Card.new('3c')] }
  end

end