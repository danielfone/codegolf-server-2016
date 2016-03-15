#
# TODO: write description
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
    @positions = input.chars
    raise InvalidPlacementError if @positions.size > 9
  end

  def to_s
    board_in_2d.each do |row|
      row.each do |cell|
        cell.gsub! '.', ' '
      end
    end
    string = ""
    string = string + "#{board_in_2d[0][0]} | #{board_in_2d[0][1]} | #{board_in_2d[0][2]}"
    string = string + "\n--+---+--\n"
    string = string + "#{board_in_2d[1][0]} | #{board_in_2d[1][1]} | #{board_in_2d[1][2]}"
    string = string + "\n--+---+--\n"
    string = string + "#{board_in_2d[2][0]} | #{board_in_2d[2][1]} | #{board_in_2d[2][2]}"
  end

private

  # This needs to be a 2D array
  # e.g. [["x", "o", "x"], ["o", "x", "o"], ["o", "o", " "]]
  def board_in_2d
    @board_in_2d ||= [
      @positions[0...3],
      @positions[3...6],
      @positions[6...9],
    ]
  end

end


while line = gets do
  board = Board.new
  board.load line.strip
  puts board.to_s
  puts
end
