module TexasHoldem
  class Deck
    attr_reader :cards

    def initialize
      @cards = Card.build_all
      @cards.shuffle!
    end

    def deal(n)
      cards.pop n
    end
  end
end
