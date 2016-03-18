#
# Take a line of naughts, crosses, and dots
# and identifier the winner of the board.
# If the board has no winner, print a '?'
#
# The input has an identical format to the ticatactoe_1 hole
#

class Board
  InvalidPlacementError = Class.new StandardError

  # Takes a simple string like e.g.
  #   "xoxoxooo."
  #   "x..o...x."
  #  Each position will correspond to a number from the grid
  #     1 | 2 | 3
  #     --+---+--
  #     4 | 5 | 6
  #     --+---+--
  #     7 | 8 | 9
  def load(input)
    @positions = input
    raise InvalidPlacementError if @positions.size > 9
  end

  # returns 'x', 'o' or `nil` for a draw or an incomplete board
  def winner
    horizontal_winner || vertical_winner || diagonal_winner
  end

private

  def diagonal_winner
    if @positions[0] != "." && @positions[0] == @positions[4] && @positions[0] == @positions[8]
      @positions[0]
    elsif @positions[2] != "." && @positions[2] == @positions[4] && @positions[2] == @positions[6]
      @positions[2]
    end
  end

  def horizontal_winner
    if @positions[0] != "." && @positions[0] == @positions[1] && @positions[0] == @positions[2]
      @positions[0]
    elsif @positions[3] != "." && @positions[3] == @positions[4] && @positions[3] == @positions[5]
      @positions[3]
    elsif @positions[6] != "." && @positions[6] == @positions[7] && @positions[6] == @positions[8]
      @positions[6]
    end
  end

  def vertical_winner
    if @positions[0] != "." && @positions[0] == @positions[3] && @positions[0] == @positions[6]
      @positions[0]
    elsif @positions[1] != "." && @positions[1] == @positions[4] && @positions[1] == @positions[7]
      @positions[1]
    elsif @positions[2] != "." && @positions[2] == @positions[5] && @positions[2] == @positions[8]
      @positions[2]
    end
  end

end


while line = gets do
  board = Board.new
  board.load line.strip
  puts board.winner||'?'
end
