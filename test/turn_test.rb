require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'

class TurnTest < Minitest::Test
  def test_it_exists
    card = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_it_has_a_guess
    card = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end

  def test_it_has_a_card
    card = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Card, card
  end

  def test_if_the_guess_is_correct
    card = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Anchorage", card)
    turn2 = Turn.new("Juneau", card)

    assert_equal turn.guess, card.answer
  end

  def test_it_gives_feedback
    card = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Anchorage", card)
    turn2 = Turn.new("Juneau", card)

    assert_equal "Incorrect", turn1.guess
    assert_equal "Correct", turn2.guess
  end

end
