class VisitsController < ApplicationController
  before_action  :require_permission, only: %i[index ]
  # GET /visits or /visits.json
  def index
    @visits = @link.visits.order(:user_agent).page params[:page]
    @chart_data = @visits.group_by_day(:date).count 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def visit_params
      params.require(:visit).permit(:user_agent, :ip_address, :host, :link_id)
    end

    def require_permission
      @link = Link.find(params[:link_id])
      unless @link.user == current_user
        redirect_to links_path,
        notice: "You do not have permission to do that."
      end
    end
end
