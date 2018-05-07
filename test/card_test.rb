require_relative 'test_helper'
require './lib/card'

class CardTest < Minitest::Test

  def setup
    @card = Card.new("10", "Spades")
  end

  def test_it_exists
    assert_instance_of Card, @card
  end

  def test_it_has_attributes
    assert_equal "10", @card.value
    assert_equal "Spades", @card.suit
  end

end
