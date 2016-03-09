# Simple implementation of the unix cat program
# Read STDIN and write it unaltered to the STDOUT

STDIN.read.each_line do |line|
  STDOUT.puts "#{line}"
end
