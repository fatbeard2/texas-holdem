require 'rspec'

describe TexasHoldem::Combinations::Straight do

  include_examples 'initialising with empty array'

  context 'when ace is used as low' do
    include_examples 'setting combination info' do
      let(:cards) {[ Card.new('2h'), Card.new('Ad'), Card.new('3s'), Card.new('5c'),
                     Card.new('4d'),  Card.new('Js'), Card.new('Qh') ]}
      let(:kicker_cards) {[]}
      let(:combination_cards) {['A♦', '2♥', '3♠', '4♦', '5♣']}
    end
  end

  context 'when there is a straight combination' do
    include_examples 'setting combination info' do
      let(:cards) {[ Card.new('Jh'), Card.new('Ad'), Card.new('Qs'), Card.new('Kc'),
                     Card.new('10d'),  Card.new('Js'), Card.new('6h') ]}
      let(:kicker_cards) {[]}
      let(:combination_cards) {['10♦', 'J♥', 'Q♠', 'K♣', 'A♦']}
    end
  end

  context 'when there is a straight with more than 5 cards' do
    include_examples 'setting combination info' do
      let(:cards) {[ Card.new('4h'), Card.new('6d'), Card.new('9s'), Card.new('5c'),
                     Card.new('7d'),  Card.new('10s'), Card.new('8h') ]}
      let(:kicker_cards) {[]}
      let(:combination_cards) {['6♦', '7♦', '8♥', '9♠', '10♠']}
    end
  end

  context 'when there is no straight' do
    include_examples 'setting combination info' do
      let(:cards) {[ Card.new('4h'), Card.new('6d'), Card.new('9s'), Card.new('5c'),
                     Card.new('7d'),  Card.new('10s'), Card.new('Jh') ]}
      let(:kicker_cards) {['J♥', '10♠', '9♠', '7♦', '6♦']}
      let(:combination_cards) {[]}
    end
  end

  include_examples '#has_combination?' do
    let(:cards_with_combination) {[ Card.new('3h'), Card.new('4h'), Card.new('5d'), Card.new('7d'), Card.new('6c') ]}
    let(:cards_without_combination) {[ Card.new('4h'), Card.new('6d'), Card.new('9s'), Card.new('5c'),
                                       Card.new('7d'),  Card.new('10s'), Card.new('Jh') ]}
  end

  include_examples 'comparing' do
    let(:strongest_combination) { [Card.new('Qs'), Card.new('Kc'), Card.new('Js'), Card.new('10c'), Card.new('Ac')] }
    let(:middle_combination1)  { [Card.new('5s'), Card.new('6c'), Card.new('7d'), Card.new('8s'), Card.new('9s')] }
    let(:middle_combination2) { [ Card.new('9s'), Card.new('8s'), Card.new('7d'), Card.new('6c'), Card.new('5s')] }
    let(:weakest_combination) { [Card.new('2s'), Card.new('3c'), Card.new('4c'), Card.new('5d'), Card.new('6d')] }
  end

end