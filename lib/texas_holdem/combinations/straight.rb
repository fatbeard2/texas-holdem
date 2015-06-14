module TexasHoldem
  module Combinations
    class Straight < Combination

      def get_combination_cards(cards)
        ranks = add_ace_low(cards_by_rank.keys).sort
        return [] if ranks.length < 5
        straight = get_all_sequences(ranks).find {|seq| seq.length >= 5}
        return [] unless straight
        straight.last(5).map do |rank|
          rank = Card::ACE_HIGH if rank == Card::ACE_LOW
          cards_by_rank[rank][0]
        end
      end

      def compare_same_rank(other)
        combination_cards.max <=> other.combination_cards.max
      end

      def add_ace_low(ranks)
        ranks << Card::ACE_LOW if ranks.index(Card::ACE_HIGH)
        ranks
      end

      def get_all_sequences(ranks)
        sequences, current_sequence = [], []
        ranks.each do |rank|
          if current_sequence.empty? || rank - current_sequence.last == 1
            current_sequence << rank
          else
            sequences << current_sequence
            current_sequence = [rank]
          end
        end
        sequences << current_sequence
      end
    end
  end
end