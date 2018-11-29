class Round

  attr_reader :deck, :turns, :current_card
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards.first
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


  def start

    puts "Welcome! You're playing with #{deck.cards.count} cards"
    puts "-" * 49
    # iterate for each question
    questions = deck.cards.map do |card|
      "This is card number #{deck.cards.index(card)} of #{deck.cards.count}."
      "Question: #{card.question}"
    end
    questions.each do |question|
      puts question
      input = gets.chomp.downcase.capitalize
      take_turn(input)
      puts turns.last.feedback
    end

    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{deck.cards.count} for a total score of #{percent_correct.round(1)}%"
    #iterate for each category
    categories = deck.cards.uniq { |card| card.category }
    category_scores = categories.map do |card|
      puts "#{card.category.to_s} - #{percent_correct_by_category(card.category)}% correct"
    end
  end

end
