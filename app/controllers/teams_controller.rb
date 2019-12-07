class TeamsController < ApplicationController
  def create
    @team = Team.new
    @team.user = current_user
    @team.save
  end
end
