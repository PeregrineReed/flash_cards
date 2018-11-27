require "minitest/autorun"
require "minitest/pride"
require "./lib/deck"

class DeckTest < Minitest::Test
  def test_it_exists
    deck = Deck.new

    assert_instance_of Deck, deck
  end

  def test_cards_can_be_read
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    deck.cards.each do |card|
      assert_instance_of Card, card
    end
    assert_equal ["Juneau", "Mars", "North north west"],
    deck.cards.map do |card|
      card.answer
    end

  end

  def test_cards_can_be_counted
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    assert_equal 3, card.count
  end

  def test_cards_can_be_seperated_by_category
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new[cards]

    assert_equal 2, deck.cards_in_category(:STEM).count
    assert_equal 1, deck.cards_in_category(:Geography).count
    assert_equal 0, deck.cards_in_category("Pop Culture").count
  end

end
