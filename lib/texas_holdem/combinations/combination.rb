module TexasHoldem
  module Combinations

    class Combination
      include Comparable

      attr_reader :cards, :cards_by_rank, :cards_by_suit, :combination_cards, :kicker_cards

      def initialize(cards)
        @cards = cards
        update_combination
      end

      def update_combination
        @cards_by_rank = get_cards_by_rank
        @cards_by_suit = get_cards_by_suit
        @combination_cards = get_combination_cards(cards)
        @kicker_cards = get_kicker_cards
      end

      def get_cards_by_rank
        cards_by_rank = {}
        cards.each do |card|
          cards_by_rank[card.rank] ||= []
          cards_by_rank[card.rank] << card
        end
        cards_by_rank
      end

      def get_cards_by_suit
        cards_by_suit = {}
        cards.each do |card|
          cards_by_suit[card.suit] ||= []
          cards_by_suit[card.suit] << card
        end
        cards_by_suit
      end

      def get_kicker_cards
        cards.delete_if do |card|
          combination_cards.include?(card)
        end.sort{ |c1, c2| c2 <=> c1 }.take(5 - combination_cards.length)
        ##todo make 5 as constant
      end

      def add_to_hand(card_to_add)
        cards << card_to_add if card_to_add.is_a?(Card)
        cards.push(*card_to_add) if card_to_add.is_a?(Array)
        update_combination
      end

      def compare_same_rank(other)
        raise NotImplementedError 'Provide an implementation of #compare_same_rank method in ancestors'
      end

      def get_combination_cards(cards)
        raise NotImplementedError 'Provide an implementation of #get_combination_cards method in ancestors'
      end

      def <=>(other)
        compared_by_rank = RANKS[self.class] <=> RANKS[other.class]
        return compared_by_rank unless compared_by_rank == 0
        compared_by_same_rank = compare_same_rank(other)
        return compared_by_same_rank unless compared_by_same_rank == 0
        compare_kickers(other)
      end

      #compares kickers of two combinations of same rank
      #kicker cards are stored in sorted array
      def compare_kickers(other)
        kicker_cards.each_with_index do |i, kicker|
          other_kicker = other.kicker_cards[i]
          compared_by_kicker = kicker <=> other_kicker
          return compared_by_kicker unless compared_by_kicker == 0
        end
      end
      0
    end
  end
end