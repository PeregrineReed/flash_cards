class Round

  include Start

  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.first
  end

  def categories
    deck.cards.uniq do |card|
      card.category
    end
  end

  def take_turn(guess)
    turns << Turn.new(guess, current_card)
    deck.cards = deck.cards.rotate(1)
    @current_card = deck.cards.first
    turns.last
  end

  def number_correct
    turns.count {|turn| turn.correct?}
  end

  def number_correct_by_category(category)
    turns.count do |turn|
      turn.correct? && turn.card.category == category
    end
  end

  def percent_correct
    (number_correct.to_f / turns.length) * 100
  end

  def percent_correct_by_category(category)
    turns_in_category = turns.count do |turn|
      turn.card.category == category
    end
    percent = (number_correct_by_category(category).to_f / (turns_in_category)) * 100
    percent = percent.round if percent == 0.0
    percent
  end

end
