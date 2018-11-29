require './card'
require './turn'
require './deck'
require './round'

cards = [card_1("In what museum in Detroit is Thomas Edison's last breath held within a vial?", "Henry Ford Museum", :Geography), card_2("In what UK city is the Dyslexia Research Trust located?", "Reading", :Geography),card_3("What is Yoda's first name?", "Minch", :Pop_culture), card_4("What fruit has more trade regulations than AK-47's?", "Bananas", :Pop_culture), card_5("In what year was Nelson Mandela removed from the US terror watch list?", "2008", :Pop_culture), card_6("True or False: a tortoise can feel a person touching its shell?", "True", :Nature)]
deck = Deck.new(cards)
round = Round.new(deck)

def start
  puts "Welcome! You're playing with #{number_of_cards} cards"
  puts "-" * 49
  # iterate for each question
  puts "This is card number #{index} of #{number_of_cards}."
  puts "Question: #{card.question}"
  input = gets.chomp.downcase.capitalize
  puts input
  puts turn.correct

  puts "****** Game over! ******"
  puts "You had #{number_correct} correct guesses out of #{number_of_cards} for a total score of #{total_percentage}%"
  #iterate for each category
  puts "#{category} - #{percent_correct}% correct"
end
