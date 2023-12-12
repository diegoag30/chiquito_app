class VisitsController < ApplicationController
  # GET /visits or /visits.json
  def index
    @link = Link.find(params[:link_id])
    @visits = @link.visits.order(:user_agent).page params[:page] 
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
end
