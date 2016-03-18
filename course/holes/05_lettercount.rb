# For every input line, output the number of characters

STDIN.read.each_line do |line|
  STDOUT.puts "#{line.size}"
end
