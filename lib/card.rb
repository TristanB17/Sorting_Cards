class Card
  attr_reader       :value,
                    :suit,
                    :number

  def initialize(value, suit)
    @value = value
    @suit = suit
    @number = get_number
  end

  def get_number
    if @value.to_i >= 2 && @value.to_i <= 10
      @value.to_i
    elsif @value == "Jack"
      11
    elsif @value == "Queen"
      12
    elsif @value == "King"
      13
    elsif @value == "Ace"
      14
    end
  end

end
