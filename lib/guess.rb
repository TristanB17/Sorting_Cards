class Guess
  attr_reader       :response,
                    :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    formatted = @response.downcase.split(' ')
    formatted[0] == @card.value.downcase && formatted[2] == @card.suit.downcase
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Wrong."
    end
  end




end
