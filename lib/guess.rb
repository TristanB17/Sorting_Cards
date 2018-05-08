class Guess
  attr_reader       :response,
                    :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    formatted = @response.downcase.split(' ')
    card_value = @card.value.downcase
    card_suit = @card.suit.downcase
    formatted[0] == card_value && formatted[2] == card_suit
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end




end
