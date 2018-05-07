require_relative 'test_helper'
require './lib/card'
require './lib/guess'

class GuessTest < Minitest::Test

  def setup
    @card = Card.new("King", "Diamonds")
    @guess = Guess.new("Queen of Clubs", @card)
  end

  def test_it_exists
    assert_instance_of Card, @card
    assert_instance_of Guess, @guess
  end

  def test_it_has_attributes
    assert_equal "Queen of Clubs", @guess.response
    assert_instance_of Card, @guess.card
  end

end
