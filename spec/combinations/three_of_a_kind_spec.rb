require 'rspec'

describe TexasHoldem::Combinations::ThreeOfAKind do

  include_examples 'initialising with empty array'

  context 'when combination is present' do
    include_examples 'setting combination info' do
      let(:cards) {[ Card.new('Jh'), Card.new('Ad'), Card.new('Qs'), Card.new('Jc'),
                     Card.new('3d'),  Card.new('Js'), Card.new('6h') ]}
      let(:kicker_cards) {['A♦', 'Q♠']}
      let(:combination_cards) {['J♥', 'J♣', 'J♠']}
    end
  end

  context 'when there are no two pairs' do
    include_examples 'setting combination info' do
      let(:cards) {[Card.new('Jh'), Card.new('Jd'), Card.new('Ad'), Card.new('As'), Card.new('2s')]}
      let(:kicker_cards) {['A♦', 'A♠', 'J♥', 'J♦', '2♠']}
      let(:combination_cards) {[]}
    end
  end

  include_examples '#has_combination?' do
    let(:cards_with_combination) {[ Card.new('Ad'), Card.new('As'), Card.new('Ah'), Card.new('6s') ]}
    let(:cards_without_combination) {[Card.new('Jh'), Card.new('Ad'), Card.new('6s')]}
  end

  include_examples 'comparing' do
    let(:strongest_combination) { [Card.new('As'), Card.new('Ac'), Card.new('As'), Card.new('Kc')] }
    let(:middle_combination1)  { [Card.new('10s'), Card.new('2c'), Card.new('10d'), Card.new('10s')] }
    let(:middle_combination2) { [Card.new('10h'), Card.new('2d'), Card.new('10h'), Card.new('10c')] }
    let(:weakest_combination) { [Card.new('2s'), Card.new('2c'), Card.new('3c'), Card.new('2d')] }
  end

end