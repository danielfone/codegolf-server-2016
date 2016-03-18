# Sort the Textbooks
#
# School is starting soon and so it's time to get our textbooks in order.
# You need to sort your books in alphabetical order
#
# Input:
#
#  _
# | |  _
# |F| | |
# |o|_|P|
# |o|B|P|
# | |a|C|
# | |r|G|
# |_|_|_|
#
# Output:
#
#    _
#   | |_
#   |F| |
#  _|o|P|
# |B|o|P|
# |a| |C|
# |r| |G|
# |_|_|_|

# Input

# The input will be a set of books which need to rearranged alphabetically.
# Check the relevent test case for an example.

# Output

# The output will need to be the same set of books organized in alphabetical order.
# The height of the books must stay the same and the title must have the same spacing from the top when re-arranged.

class Bookshelf

  def initialize(input)
    @input = input
  end

  def sort_alphabetically
    reordered_books.join "\n"
  end

private

  def reordered_books
    new_books = books.dup
    sorted_titles.each_with_index do |title, book_index|
      write_book title, book_index, new_books
    end
    new_books
  end

  def books
    @books ||= @input.gsub('|', ' ').split "\n"
  end

  def transposed_books
    @transposed_books ||= books.map(&:chars).transpose.map { |chars| chars.join }
  end

  def sorted_titles
    @sorted_titles ||= titles.sort_by { |s| s.delete ' _' }
  end

  def titles
    @titles ||= transposed_books.each_with_index.select { |line, index| index.odd? }.map { |line, index| line }
  end

  def write_book(title, book_index, bookshelf)
    x_position = book_index * 2 + 1
    on_spine = false
    letters = title.chars

    # go through each character of each title, including leading spaces and '_'s
    # this will "descend" down the array writing each letter of the title
    # along with the "edges"

    letters.each_with_index do |letter, y_position|
      bookshelf_line = bookshelf[y_position]
      # If we're on the spine, draw the edges of the book
      if on_spine == true
        bookshelf_line[x_position-1] = '|'
        bookshelf_line[x_position+1] = '|'
      end

      bookshelf_line[x_position] = letter; # write the current title char into the second (x+1) column

      if ! on_spine && letter == '_'
        on_spine = true
      elsif on_spine && letter == '_'
        on_spine = false
      end
    end
  end

end

bookshelf = Bookshelf.new STDIN.read
puts bookshelf.sort_alphabetically
