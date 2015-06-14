require 'byebug'
module TexasHoldem
  module Combinations
    class Flush < Combination

      def get_combination_cards(cards)
        same_suit = cards_by_suit.find do |suit, cards_of_same_suit|
          cards_of_same_suit.length >= 5
        end
        same_suit ? same_suit[1].sort.last(5) : []
      end

      def compare_same_rank(other)
        combination_cards.each_with_index do |highest_card, i|
          other_highest_card = other.combination_cards[i]
          compared_by_high = highest_card <=> other_highest_card
          return compared_by_high unless compared_by_high == 0
        end
        0
      end

    end
  end
end