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

  def test_sort
    card_1 = Card.new("Ace", "Clubs")
    card_2 = Card.new("4","Hearts")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Queen", "Spades")
    card_5 = Card.new("Jack", "Hearts")
    card_6 = Card.new("3", "Clubs")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6])

    assert_equal [card_1, card_2, card_3, card_4, card_5, card_6], deck.cards
    assert_equal [card_6, card_2, card_3, card_5, card_4, card_1], deck.sort
  end

  def test_sort_alternate
    card_1 = Card.new("Ace", "Clubs")
    card_2 = Card.new("4","Hearts")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Queen", "Spades")
    card_5 = Card.new("Jack", "Hearts")
    card_6 = Card.new("3", "Clubs")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6])

    assert_equal [card_1, card_2, card_3, card_4, card_5, card_6], deck.cards
    assert_equal [card_6, card_2, card_3, card_5, card_4, card_1], deck.sort_alternate
  end

  def test_more_complex_merge_sort
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("7", "Spades")
    card_3 = Card.new("3", "Clubs")
    card_4 = Card.new("5", "Diamonds")
    card_5 = Card.new("6", "Diamonds")

    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

    assert_equal [card_1, card_2, card_3, card_4, card_5], deck.cards
    assert_equal [card_3, card_1, card_4, card_5, card_2], deck.merge_sort
  end

end
