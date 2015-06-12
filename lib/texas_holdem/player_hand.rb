module TexasHoldem
  class PlayerHand
    attr_reader :combination, :cards

    def initialize(cards)
      @cards = cards
      @combination = best_combination(cards)
    end

    def <=>(other)
      other.combination <=> combination
    end

    def best_combination(cards)

    end
  end
end