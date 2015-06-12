module TexasHoldem
  class Card
    include Comparable
    NUM_RANKS = 2..10
    FACE_CARD_RANKS = { J: 11, Q: 12, K: 13, A: 14 }
    SUITS = {c: '♣', s: '♠', h: '♥', d: '♦'}

    attr_reader :suit, :rank

    def self.build_all
      all = []
      SUITS.each do |suit, icon|
        NUM_RANKS.to_a.tap {|num_ranks| num_ranks.concat(FACE_CARD_RANKS.keys) }.each do |rank|
          all << new(rank.to_s + suit.to_s)
        end
      end
      all
    end

    def initialize(card_as_string)
      @suit = parse_suit(card_as_string)
      @rank = parse_rank(card_as_string)
    end

    def is_face_card?
      FACE_CARD_RANKS.has_key? rank.to_sym
    end

    def to_i
      is_face_card? ? FACE_CARD_RANKS[rank.to_sym] : rank.to_i
    end

    def to_s
      rank + SUITS[suit.to_sym]
    end

    def <=>(other_card)
      to_i <=> other_card.to_i
    end

    private

    def parse_suit(card_as_string)
      raw_suit = card_as_string[-1]
      return raw_suit if SUITS[raw_suit.to_sym]
      raise ArgumentError, "Incorrect suit #{raw_suit}. Use only #{SUITS.keys}"
    end

    def parse_rank(card_as_string)
      raw_rank = card_as_string[0..-2]
      return raw_rank if NUM_RANKS.include?(raw_rank.to_i)
      return raw_rank if FACE_CARD_RANKS.include?(raw_rank.to_sym)
      raise ArgumentError.new "Incorrect rank #{raw_rank}. Use only #{NUM_RANKS} or #{FACE_CARD_RANKS.keys}"
    end
  end
end
