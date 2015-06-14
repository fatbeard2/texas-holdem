require 'rspec'

describe TexasHoldem::Combinations::Flush do

  include_examples 'initialising with empty array'

  context 'when combination is present' do
    include_examples 'setting combination info' do
      let(:cards) {[ Card.new('Jh'), Card.new('Ah'), Card.new('Qh'), Card.new('3c'),
                     Card.new('4h'),  Card.new('Js'), Card.new('6h') ]}
      let(:kicker_cards) {[]}
      let(:combination_cards) {['4♥', '6♥', 'J♥', 'Q♥', 'A♥']}
    end
  end

  context 'when there is no flush' do
    include_examples 'setting combination info' do
      let(:cards) {[Card.new('Jh'), Card.new('Ah'), Card.new('6h'), Card.new('Qh'), Card.new('Qd')]}
      let(:kicker_cards) {['A♥', 'Q♦', 'Q♥', 'J♥', '6♥']}
      let(:combination_cards) {[]}
    end
  end

  context 'when there is more than 5 cards in flush' do
    include_examples 'setting combination info' do
      let(:cards) {[ Card.new('Jh'), Card.new('Ah'), Card.new('Qh'), Card.new('10h'),
                     Card.new('4h'),  Card.new('Js'), Card.new('6h') ]}
      let(:kicker_cards) {[]}
      let(:combination_cards) {['6♥', '10♥', 'J♥', 'Q♥', 'A♥']}
    end
  end

  include_examples '#has_combination?' do
    let(:cards_with_combination) {[ Card.new('Ah'), Card.new('Qh'), Card.new('10h'), Card.new('9h'), Card.new('2h') ]}
    let(:cards_without_combination) {[Card.new('Jh'), Card.new('Ad'), Card.new('6s')]}
  end


  include_examples 'comparing' do
    let(:strongest_combination) { [ Card.new('Kh'), Card.new('Qh'), Card.new('Jh'), Card.new('4h'), Card.new('5h') ] }
    let(:middle_combination1)  { [ Card.new('Kh'), Card.new('Qh'), Card.new('10h'), Card.new('9h'), Card.new('2h') ] }
    let(:middle_combination2) { [ Card.new('2d'), Card.new('9d'), Card.new('10d'), Card.new('Qd'), Card.new('Kd') ] }
    let(:weakest_combination) { [ Card.new('Kh'), Card.new('Qh'), Card.new('9h'), Card.new('5h'), Card.new('2h') ] }
  end

end