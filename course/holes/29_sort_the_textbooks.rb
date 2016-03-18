bookshelf = STDIN.read

book_array = bookshelf.gsub('|', ' ').split "\n"

transposed_book_array = book_array.map(&:chars).transpose.map { |chars| chars.join }

titles = transposed_book_array.each_with_index.select { |line, index| index.odd? }.map { |line, index| line }
sorted_titles = titles.sort_by { |s| s.delete ' _' }

# go through each title
sorted_titles.each_with_index do |title, book_index|
  x_position = book_index * 2 + 1
  on_spine = false
  letters = title.chars

  # go through each character of each title, including leading spaces and '_'s
  # this will "descend" down the array writing each letter of the title
  # along with the "edges"


  letters.each_with_index do |letter, y_position|
    bookshelf_line = book_array[y_position]
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
book_array.join "\n"

puts book_array
