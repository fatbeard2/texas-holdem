module TexasHoldem
  class PlayerHand
    include Comparable
    attr_reader :best_combination, :cards

    def initialize(cards)
      @cards = cards
      @best_combination = get_best_combination
    end

    def add_cards(cards)
      @cards.push(*cards)
      @best_combination = get_best_combination
    end

    def <=>(other)
      best_combination <=> other.best_combination
    end

    private

    def get_best_combination
      Combinations::RANKS.keys.map do |combination_class|
        combination_class.new(cards)
      end.find(&:has_combination?)
    end
  end
end