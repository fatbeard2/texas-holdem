module TexasHoldem
  class Game

    attr_reader :players, :common_cards

    def initialize(players, deck)
      @players = players
      @common_cards = []
      @common_cards << deck.deal(5)
      players.each do |player|
        player.add_to_hand(deck.deal(2).concat(@common_cards))
      end
    end

    def strongest_hand
      players.sort_by(&:hand)
    end
  end
end