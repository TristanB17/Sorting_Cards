require_relative 'test_helper'
require './lib/guess'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Card, card_1
    assert_instance_of Deck, deck
    assert_instance_of Round, round
    assert_equal [], round.guesses
  end

  def test_current_card_with_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal card_1, round.current_card
    round.record_guess("3 of Hearts")
    assert_equal "3 of Hearts", round.guesses[0].response
    assert_equal 1, round.guesses.count
    assert_equal "Correct!", round.guesses[0].feedback
    assert_equal 1, round.number_correct
  end

  def test_round_can_evaluate_multiple_cards
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal card_1, round.current_card
    round.record_guess("3 of Hearts")
    assert_equal card_2, round.current_card
    round.record_guess("Jack of Diamonds")
    assert_equal 2, round.guesses.count
    assert_equal "Incorrect.", round.guesses.last.feedback
    assert_equal 1, round.number_correct
    assert_equal 50, round.percent_correct
  end

end
