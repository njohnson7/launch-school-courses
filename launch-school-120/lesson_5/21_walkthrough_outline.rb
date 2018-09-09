# 21_walkthrough_outline.rb

# Player
  # hit
  # stay
  # busted?
  # total
# Dealer
  # hit
  # stay
  # busted?
  # total
  # deal (should this be here, or in Deck?)
# Participant
# Deck
  # deal (should this be here, or in Dealer?)
# Card
# Game
  # start

class Player
  def initialize

  end

  def hit

  end

  def stay

  end

  def busted?

  end

  def total

  end
end

class Dealer
  def initialize

  end

  def hit

  end

  def stay

  end

  def busted?

  end

  def total

  end
end

class Participant

end

class Deck
  def initialize

  end

  def deal

  end
end

class Card
  def initialize

  end
end

class Game
  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

Game.new.start
