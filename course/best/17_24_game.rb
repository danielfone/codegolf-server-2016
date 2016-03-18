module TwentyFourGame
  EXPRESSIONS = [
    '((%dr %s %dr) %s %dr) %s %dr',
    '(%dr %s (%dr %s %dr)) %s %dr',
    '(%dr %s %dr) %s (%dr %s %dr)',
    '%dr %s ((%dr %s %dr) %s %dr)',
    '%dr %s (%dr %s (%dr %s %dr))',
  ]

  OPERATORS = [:+, :-, :*, :/].repeated_permutation(3).to_a

  def self.solve(digits)
    solutions = []
    perms = digits.permutation.to_a.uniq
    perms.product(OPERATORS, EXPRESSIONS) do |(a,b,c,d), (op1,op2,op3), expr|
      # evaluate using rational arithmetic
      text = expr % [a, op1, b, op2, c, op3, d]
      value = eval(text)  rescue next                 # catch division by zero
      solutions << text.delete("r")  if value == 24
    end
    solutions.sort
  end
end

# validate user input
$<.each{|l|
  digits = l.split.map {|digit| digit.to_i }
  solutions = TwentyFourGame.solve(digits)
  if solutions.empty?
    puts "-"
  else
    puts solutions.sort
  end
}
