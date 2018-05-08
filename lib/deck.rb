class Deck
  attr_reader :cards,
              :count

  def initialize(cards)
    @cards = cards
    @count = @cards.count
  end

  def sort
    pairs_length = cards.length - 1
    pairs_length.times do
      current_index = 0
      pairs_length.times do
        if cards[current_index].number > cards[current_index + 1].number
          cards[current_index], cards[current_index + 1] = cards[current_index + 1], cards[current_index]
        end
        current_index += 1
      end
    end
    cards
  end

end
