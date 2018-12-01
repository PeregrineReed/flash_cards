require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/card_generator'
require './lib/card'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    file = 'cards.txt'
    card_generator = CardGenerator.new(file)

    assert_instance_of CardGenerator, card_generator
  end

  def test_it_can_make_cards
    file = 'cards.txt'
    card_generator = CardGenerator.new(file)
    card_list = card_generator.cards
    all_cards = card_list.all? do |card|
      card.class == Card
    end
    assert_equal true, all_cards
    assert_equal 6, card_list.length
  end

end
