#
# Each input line is a series of numbers, separated by spaces
# Each output line should be the corresponding sum
#

@totals = []

while line = $stdin.gets do
  line_total = 0
  numbers = line.scan(/\d+/)
  numbers = numbers.map { |number| number.to_i }
  numbers.each do |number|
    line_total += number.to_i
  end

  @totals << line_total
end

@totals.each do |total|
  $stdout.puts "#{total.to_s}\n"
end
