require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("In what museum in Detroit is Thomas Edison's last breath held within a vial?", "Henry Ford Museum", :Geography)
card_2 = Card.new("In what UK city is the Dyslexia Research Trust located?", "Reading", :Geography)
card_3 = Card.new("What is Yoda's first name?", "Minch", :Pop_culture)
card_4 = Card.new("What fruit has more trade regulations than AK-47's?", "Bananas", :Pop_culture)
card_5 = Card.new("In what year was Nelson Mandela removed from the US terror watch list?", "2008", :Pop_culture)
card_6 = Card.new("True or False: a tortoise can feel a person touching its shell?", "True", :Nature)
cards = [card_1, card_2, card_3, card_4, card_5, card_6]
deck = Deck.new(cards)
round = Round.new(deck)

round.start
