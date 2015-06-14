module TexasHoldem
  module Combinations
    class Pair < Combination

      def get_combination_cards(cards)
        cards_by_rank.each do |rank, cards_of_same_rank|
          return cards_of_same_rank if cards_of_same_rank.length == 2
        end
        []
      end

      def compare_same_rank(other)
        combination_cards[0] <=> other.combination_cards[0]
      end

    end
  end
end