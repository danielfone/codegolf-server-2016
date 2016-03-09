class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def create
    @team = Team.new params[:team].permit(:name)
    @team.save and flash[:notice] = "Team '#{@team.name}' created"
    respond_with @team, location: scorecard_path
  end

end
