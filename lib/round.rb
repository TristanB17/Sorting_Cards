class Round
  attr_reader   :deck,
                :guesses,
                :position,
                :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @position = 0
    @number_correct = 0
  end

  def current_card
    @deck.cards[@position]
  end

  def record_guess(guess)
    question = Guess.new(guess, current_card)
    @number_correct += 1 if question.correct?
    @position += 1
    @guesses << question
    question
  end

  def percent_correct
    ((@number_correct.to_f / @guesses.length.to_f) * 100).to_i
  end

end
