require 'rspec'

# ["Q♦", "Q♠"]
# Cards on table: ["7♣", "A♥", "A♠", "8♥", "7♥"]
#[Card.new('Qd'),Card.new('Qs'),Card.new('7c'),Card.new('Ah'),Card.new('As'),Card.new('8h'),Card.new('7h')]

describe TexasHoldem::Combinations::TwoPairs do

  include_examples 'initialising with empty array'

  context 'when combination is present' do
    include_examples 'setting combination info' do
      let(:cards) {[ Card.new('Jh'), Card.new('Ad'), Card.new('Qs'), Card.new('3c'),
                     Card.new('3d'),  Card.new('Js'), Card.new('6h') ]}
      let(:kicker_cards) {['A♦']}
      let(:combination_cards) {['J♥', 'J♠', '3♣', '3♦']}
    end
  end

  context 'when there are no two pairs' do
    include_examples 'setting combination info' do
      let(:cards) {[Card.new('Jh'), Card.new('Jd'), Card.new('Ad'), Card.new('6s')]}
      let(:kicker_cards) {['A♦', 'J♥', 'J♦', '6♠']}
      let(:combination_cards) {[]}
    end
  end

  context 'when there are three pairs' do
    include_examples 'setting combination info' do
      let(:cards) { [Card.new('Qd'), Card.new('Qs'), Card.new('7c'), Card.new('Ah'),
                     Card.new('As'), Card.new('8h'), Card.new('7h')] }
      let(:kicker_cards) {['8♥']}
      let(:combination_cards) {['Q♦', 'Q♠', 'A♥', 'A♠']}
    end
  end

  include_examples '#has_combination?' do
    let(:cards_with_combination) {[ Card.new('Ad'), Card.new('As'), Card.new('6h'), Card.new('6s') ]}
    let(:cards_without_combination) {[Card.new('Jh'), Card.new('Ad'), Card.new('6s')]}
  end

  include_examples 'comparing' do
    let(:strongest_combination) { [Card.new('Qs'), Card.new('Qc'), Card.new('2s'), Card.new('2c')] }
    let(:middle_combination1)  { [Card.new('2s'), Card.new('2c'), Card.new('10d'), Card.new('10s')] }
    let(:middle_combination2) { [Card.new('5h'), Card.new('5d'), Card.new('10h'), Card.new('10c')] }
    let(:weakest_combination) { [Card.new('2s'), Card.new('2c'), Card.new('3c'), Card.new('3d')] }
  end

end