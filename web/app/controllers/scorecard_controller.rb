class ScorecardController < ApplicationController

  def show
    @meta_refresh = 10
    @card = Scorecard.new
  end

end
