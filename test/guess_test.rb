require_relative 'test_helper'
require './lib/card'
require './lib/guess'
require 'pry'

class GuessTest < Minitest::Test

  def setup
    card = Card.new("King", "Diamonds")
    guess = Guess.new("Queen of Clubs", card)
  end

  def test_it_exists
    card = Card.new("King", "Diamonds")
    guess = Guess.new("Queen of Clubs", card)

    assert_instance_of Card, card
    assert_instance_of Guess, guess
  end

  def test_it_has_attributes
    card = Card.new("King", "Diamonds")
    guess = Guess.new("Queen of Clubs", card)

    assert_equal "Queen of Clubs", guess.response
    assert_instance_of Card, guess.card
  end

  def test_correct_with_false_card
    card = Card.new("King", "Diamonds")
    guess = Guess.new("Queen of Clubs", card)

    refute guess.correct?
    assert_equal "Wrong.", guess.feedback
  end

  def test_correct_with_true_card
    card = Card.new("King", "Diamonds")
    guess = Guess.new("King of Diamonds", card)

    assert guess.correct?
    assert_equal "Correct!", guess.feedback
  end
end
