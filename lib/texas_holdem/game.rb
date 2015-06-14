module TexasHoldem
  class Game

    attr_reader :players, :common_cards

    def initialize(players_count, deck)
      @players = []
      @common_cards = deck.deal(5)
      players_count.times do |i|
        player_cards = deck.deal(2)
        puts "Player #{i} gets #{player_cards.map(&:to_s)}"
        players << PlayerHand.new(player_cards.concat(@common_cards))
      end
      puts "Cards on table: #{@common_cards.map(&:to_s)}"
      puts "The winner is player #{@players.index(winner)} with combination #{winner.best_combination}"
    end

    def winner
      players.max
    end
  end
end