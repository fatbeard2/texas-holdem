module TexasHoldem
  module Combinations
    class TwoPairs < Combination

      def get_combination_cards(cards)
        pairs = []
        cards_by_rank.each do |rank, cards_of_same_rank|
          pairs << cards_of_same_rank if cards_of_same_rank.length == 2
        end
        if pairs.length == 2
          pairs.flatten
        elsif pairs.length > 2
          pairs.sort_by { |pair| pair[0] }.last(2).flatten
        else
          []
        end
      end

      def compare_same_rank(other)
        combination_cards.max <=> other.combination_cards.max
      end

    end
  end
end