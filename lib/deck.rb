require "./lib/card"

class Deck

  attr_accessor :cards
  def initialize(cards = [])
    @cards = cards
  end

end
