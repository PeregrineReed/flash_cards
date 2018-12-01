require 'csv'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/start'
require './lib/round'
require './lib/card_generator'

cards = CardGenerator.new('cards.txt').cards
deck = Deck.new(cards)
round = Round.new(deck)

round.start
