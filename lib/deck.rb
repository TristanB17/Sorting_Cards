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

  def merge_sort(card_array)
    if card_array.count == 1
      return card_array
    end
    half = (card_array.length / 2)
    left = card_array[0..half]
    right = card_array[half..card_array.length]
    merge(left, right)
  end

  def merge(left, right)
    output = []
    until left.empty? || right.empty?
      output << if left.first.number <= right.first.number
        left.shift
      else
        right.shift
      end
    end
    output.concat(left).concat(right).uniq!
  end

end
