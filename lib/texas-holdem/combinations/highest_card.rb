module TexasHoldem
  module Combinations
    class HighestCard < Combination
      def get_combination_cards(cards)
        cards.empty? ? [] : [cards.max]
      end

      def compare_same_rank(other)
        combination_cards[0] <=> other.combination_cards[0]
      end
    end
  end
end
