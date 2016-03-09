class Scorecard

  def hole_names
    holes.keys
  end

  def teams
    Team.all
  end

  def hole_lengths
    holes.map { |h,v| v['length'] }
  end

  def pars
    holes.map { |h,v| v['par'] }
  end

  def bests
    holes.map { |h,v| v['best'] }
  end

private

  def holes
    JSON.parse File.read COURSE_JSON_FILE
  rescue
    {}
  end

end
