class TeamMembersController < ApplicationController
  def index
    render json: TeamMember.order(created_at: :asc).all.to_json
  end

  def create
    @team_member = TeamMember.new(team_member_params)
    if @team_member.save
      head :created
    else
      head :bad_request
    end
  end

  def destroy
    team_member = TeamMember.find_by(id: params[:id])
    head :ok if team_member.destroy
  end

  private
    def team_member_params
      params.require(:team_member).permit(:name, :photo, :job_title)
    end
end
