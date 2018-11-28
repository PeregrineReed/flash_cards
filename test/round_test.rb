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

  def test_that_a_round_has_a_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert round.current_card
    assert_same card_1, round.current_card
  end

  


end
