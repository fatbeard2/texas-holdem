module TexasHoldem
  module Combinations
    #Order matters. Highest combinations should go first
    RANKS = {
        Flush => 6,
        Straight => 5,
        ThreeOfAKind => 4,
        TwoPairs => 3,
        Pair => 2,
        HighestCard => 1
    }
  end
end