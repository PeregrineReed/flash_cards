require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'

class RoundTest < Minitest::Test

  def test_it_starts_with_a_deck
    deck = Deck.new
    round = Round.new(deck)

    assert_instance_of Round, round
    assert_instance_of Deck, round.deck
  end

  def test_that_a_round_has_turns
    deck = Deck.new
    round = Round.new(deck)

    assert round.turns
    assert_equal [], round.turns
  end


end
