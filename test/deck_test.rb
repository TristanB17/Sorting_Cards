require_relative 'test_helper'
require './lib/guess'
require './lib/card'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_instance_of Card, card_1
    assert_instance_of Deck, deck
    assert_equal [card_1, card_2, card_3], deck.cards
    assert_equal 3, deck.count
  end

end
