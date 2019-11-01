class TeamsController < ApplicationController
  def new
    @team = Team.new
    @team.user = current_user
  end

  def create
    @team.user = current_user
    Team.create(team_params)
  end

  private

  def team_params
    params.require(:team).permit(:current_user)
  end
end
