class Deck
  attr_reader :cards,
              :count

  def initialize(cards)
    @cards = cards
    @count = @cards.count
  end

  def sort
    pairs_length = @cards.length - 1
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

  def sort_alternate
    swapped = true
    while swapped
      swapped = false
      (cards.length - 1).times do |index|
        if cards[index].number > cards[index + 1].number
          cards[index], cards[index + 1] = cards[index + 1], cards[index]
          swapped = true
        end
      end
    end
    cards
  end

  def merge_sort
    split_again(@cards)
  end

  def split_again(array)
    if array.length == 1
      return array
    end
    half = (array.length / 2).floor
    left = array[0..(half - 1)]
    right = array[half..(array.length - 1)]
    merge(split_again(left), split_again(right))
  end

  def merge(left, right)
    output = []
    until left.empty? || right.empty?
      if left[0].number <= right[0].number
        output << (left.shift)
      else
        output << (right.shift)
      end
    end
    result = output.concat(left).concat(right)
    return result
  end

end
