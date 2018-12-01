module Start

  def start

    puts ""
    puts ""
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
    puts "You had #{number_correct} correct guesses out of #{deck.cards.count} for a total score of #{percent_correct.to_i}%"

    categories.each do |card|
      puts "#{card.category.to_s} - #{percent_correct_by_category(card.category).to_i}% correct"
    end
    puts ""
    puts ""
  end

end
