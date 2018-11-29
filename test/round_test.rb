require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
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

  def test_that_taking_a_turn_creates_a_new_instance_of_the_turn_class
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")
    assert_instance_of Turn, new_turn
    assert_same round.turns[0], new_turn
  end

  def test_that_taking_a_turn_changes_the_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_same deck.cards[0], round.current_card
    round.take_turn("Juneau")
    assert_same deck.cards[0], round.current_card && card_2
  end

  def test_number_of_correct_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn("Juneau")
    assert_equal 1, round.number_correct
    round.take_turn("Venus")
    assert_equal 1, round.number_correct
    round.take_turn("North north west")
    assert_equal 2, round.number_correct
  end

  def test_number_of_correct_guesses_by_category
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn("Juneau")
    assert_equal 1, round.number_correct_by_category(:Geography)
    round.take_turn("Venus")
    assert_equal 0, round.number_correct_by_category(:STEM)
    round.take_turn("North north west")
    assert_equal 1, round.number_correct_by_category(:STEM)
  end

  def test_percentage_of_correct_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.turns[0].correct?
    assert_equal 100.0, round.percent_correct
    assert_instance_of Float, round.percent_correct

    round.take_turn("Venus")
    assert_equal 50.0, round.percent_correct
  end

  def test_percentage_of_correct_guesses_for_category #add specific category
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")
    assert_equal 100.0, round.percent_correct_by_category(:Geography)
    assert_instance_of Float, round.percent_correct_by_category(:Geography)
    assert_equal 0, round.percent_correct_by_category(:STEM)
    assert_instance_of Integer, round.percent_correct_by_category(:STEM)
  end

end
