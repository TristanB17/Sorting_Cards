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

  def merge_sort
    if @count == 1
      return @cards
    end
    half = (@count / 2)
    left = @cards[0..half]
    right = @cards[half..@count]
    merge(left, right)
  end

  def merge(left, right)
    output = []
    until left.empty? || right.empty?
      output << (left[0].number <= right[0].number ? left : right).shift
    end
    result = output.concat(left).concat(right)
    result.uniq!
  end

end
