require './lib/deck'
require './lib/turn'

class Round

  attr_reader :deck, :turns, :current_card
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards.first
  end

  def take_turn(guess)
    turns << Turn.new(guess, current_card)
    turns[0]
  end

end
