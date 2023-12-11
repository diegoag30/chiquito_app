
class LinksController < ApplicationController
  before_action  :set_link, only: %i[edit update destroy ]
  before_action :set_by_id_or_slug, only: %i[show]
  # GET /links or /links.json
  def index
    @links = current_user.links
  end

  # GET /links/1 or /links/1.json
  def show
    unless @link
      render file: "#{Rails.root}/public/404.html", layout: true, status: :not_found
    end
    if @redirect
      url = "https://#{@link.public_url}"
      redirect_to url, allow_other_host: true
    end
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links or /links.json
  def create
    @link = build_link(link_params)
    @link.user_id = current_user.id
    @link.slug = Nanoid.generate(size: 5)
    #@link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to link_url(@link), notice: "Link was successfully created." }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1 or /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to link_url(@link), notice: "Link was successfully updated." }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1 or /links/1.json
  def destroy
    @link.destroy!

    respond_to do |format|
      format.html { redirect_to links_url, notice: "Link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    def set_by_id_or_slug

      if params[:id].to_i.to_s == params[:id]
        # params[:id] is numeric, try to find by ID
        @link = current_user.links.find_by(id: params[:id])
      else
        # params[:id] is not numeric, try to find by slug
        @link = current_user.links.find_by(slug: params[:id])
        @redirect = true
      end
    end

    # Only allow a list of trusted parameters through.
    def link_params
      params.require(:link).permit(:public_url, :slug, :password, :type, :created_at, :expiration_date, :active, :user_id,)
    end

    def clean_fields(params)
      if params[:type] != "PrivateLink"
        params.delete(:password)
      end
      if params[:type] != "TemporaryLink"
        params.delete(:expiration_date)
      end
      return params
    end

    def build_link(params)
      params = clean_fields(params)
      link_type = params.delete(:type)
      if Link.subclasses.map(&:name).include?(link_type)
        link_type.constantize.new(params)
      else
        Link.new(params)
      end
    end
end
