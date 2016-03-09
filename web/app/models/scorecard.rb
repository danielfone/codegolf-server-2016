class Scorecard

  def hole_names
    (1..18).to_a
  end

  def teams
    []
  end

  def hole_lengths
    Array.new(18, 0)
  end

  def pars
    Array.new(18, 0)
  end

  def bests
    Array.new(18, 0)
  end

  def holes
    []
  end

end
