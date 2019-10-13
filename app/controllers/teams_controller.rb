class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    Team.create(team_params) unless @team.pokemons.count <= 6
  end

  private

  def team_params
    params.require(:team).permit(:user)
  end
end
