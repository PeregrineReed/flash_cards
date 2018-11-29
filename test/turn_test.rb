require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
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
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn_1 = Turn.new("Saturn", card)
    turn_2 = Turn.new("Mercury", card)

    refute turn_1.correct?
    assert turn_2.correct?
  end

  def test_it_gives_feedback
    card = Card.new("Which planet is closesst to the sub?", "Mercury", :STEM)
    turn_1 = Turn.new("Saturn", card)
    turn_2 = Turn.new("Mercury", card)

    assert_equal "Incorrect", turn_1.feedback
    assert_equal "Correct", turn_2.feedback
  end

end
