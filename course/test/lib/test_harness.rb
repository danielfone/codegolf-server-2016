class TestHarness

  def initialize(tests)
    @tests = tests
  end

  def run
    @tests.each do |test|
      printf "Running %-22s" % test.name
      if test.valid?
        puts test.passed? ? "passed [#{test.score} bytes]" : "failed! :("
      else
        puts "skipping"
      end
    end
    render_result
  end

  def passed?
    @tests.all?(&:passed?)
  end

  def scores
    Hash[@tests.map { |t| [t.hole, t.score] }]
  end

private

  def render_result
    if passed?
      puts "----"
      puts "Your score: #{total}"
    else
      puts
      STDERR.puts "Errors"
      @tests.each do |test|
        if test.errors.any?
          STDERR.puts test.errors.map { |e| "\t#{e}" }
        elsif ! test.passed?
          render_diff test
        end
      end
    end
  end

  def total
    @tests.map(&:score).inject(0, :+)
  end

  def render_diff(t)
    STDERR.puts
    STDERR.puts "#{t.name} diff:"
    STDERR.puts t.diff
  end

end
