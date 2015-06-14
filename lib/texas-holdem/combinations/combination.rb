module TexasHoldem
  module Combinations

    class Combination
      include Comparable
      MAX_COMBINATION_LENGTH = 5
      attr_reader :cards, :cards_by_rank, :cards_by_suit, :combination_cards, :kicker_cards

      def initialize(cards)
        @cards = cards
        @cards_by_rank = get_cards_by_rank
        @cards_by_suit = get_cards_by_suit
        @combination_cards = get_combination_cards(cards)
        @kicker_cards = get_kicker_cards
      end

      def has_combination?
        combination_cards.length > 0
      end

      def <=>(other)
        compared_by_rank = RANKS[self.class] <=> RANKS[other.class]
        return compared_by_rank unless compared_by_rank == 0
        compared_by_same_rank = compare_same_rank(other)
        return compared_by_same_rank unless compared_by_same_rank == 0
        compare_kickers(other)
      end

      def to_s
        "#{combination_cards.map(&:to_s)}, kickers: #{kicker_cards.map(&:to_s)}"
      end

      private

      def get_cards_by_rank
        cards_by_rank = {}
        cards.each do |card|
          cards_by_rank[card.to_i] ||= []
          cards_by_rank[card.to_i] << card
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
        cards.reject do |card|
          combination_cards.include?(card)
        end.sort{ |c1, c2| c2 <=> c1 }.take(MAX_COMBINATION_LENGTH - combination_cards.length)
      end

      #Template method
      #every ancestor of Combination class is supposed to implement this method
      #return -1,0 or 1 as a result of comparing two combinations of same class
      def compare_same_rank(other)
        raise NotImplementedError 'Provide an implementation of #compare_same_rank method in ancestors'
      end

      #Template method
      #every ancestor of Combination class is supposed to implement this method
      #returns an array containing all cards needed to build a combination
      #if there is no way to build a combination return an empty array
      def get_combination_cards(cards)
        raise NotImplementedError 'Provide an implementation of #get_combination_cards method in ancestors'
      end

      #compares kickers of two combinations of same rank
      #assuming kicker cards are stored in sorted array
      def compare_kickers(other)
        kicker_cards.each_with_index do |kicker, i|
          other_kicker = other.kicker_cards[i]
          compared_by_kicker = kicker <=> other_kicker
          return compared_by_kicker unless compared_by_kicker == 0
        end
        0
      end
    end
  end
end