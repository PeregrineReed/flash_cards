require "./lib/card"

class Deck

  attr_accessor :cards
  attr_reader :count
  def initialize(cards = [])
    @cards = cards
    @count = cards.count
  end

  def cards_in_category(category)
    @cards.select do |card|
      card.category == category
    end
  end

end
