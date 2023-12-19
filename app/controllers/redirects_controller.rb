class RedirectsController < ApplicationController
  before_action :set_link_by_slug, only: %i[show]
  skip_before_action :verify_authenticity_token, only: [:redirect]

  def show
    unless @link.type == 'PrivateLink'
      @verified = @link.verify_visit()
      redirect_or_fail(@verified)
    end
    #ELSE RENDER
  end

  def redirect
    @link = current_user.links.find(params[:id])
    password = params[:link][:password]
    @verified = @link.verify_visit(password)
    redirect_or_fail(@verified)
  end

  def set_link_by_slug
    @link = current_user.links.find_by(slug: params[:id])
  end

  def redirect_or_fail(verified)
    if verified
      @link.visits.create(date: DateTime.now, ip_address: request.remote_ip,user_agent: request.user_agent)
      url = "https://#{@link.public_url}"
      redirect_to(url, allow_other_host: true) and return   
    else
      raise ActionController::RoutingError.new("Not Found")
    end    
  end
  
end
