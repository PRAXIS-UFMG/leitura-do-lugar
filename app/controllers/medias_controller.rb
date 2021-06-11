class MediasController < AdminController
  before_action :set_media, only: [:show, :inline, :edit, :update, :destroy]
  after_action :set_error_flash, only: [:create, :update]
  skip_before_action :authenticate!, only: :show

  # GET /media
  def index
    @medias = Media.all
  end

  # GET /media/1
  def show
  end

  def inline
    redirect_to @media.file.url, status: :see_other
  end

  # GET /media/1/edit
  def edit
    respond_to do |format|
      format.html { render "form" }
      format.turbo_stream { render_partial "media_edit" }
    end
  end

  # POST /media
  def create
    @media = Media.new(media_params)

    respond_to do |format|
      if @media.save
        format.html { redirect_to @media, notice: t("notice.created", model: Media.lowercase_human_name) }
        format.turbo_stream { render_partial "media_create" }
      else
        format.html { render "form" }
        format.turbo_stream { render_partial "media_edit" }
      end
    end
  end

  # PATCH/PUT /media/1
  def update
    respond_to do |format|
      if @media.update(media_params)
        format.html { redirect_to @media, notice: t("notice.updated", model: Media.lowercase_human_name) }
        format.turbo_stream { render partial: "media_update", locals: { media: @media } }
      else
        format.html { render "form" }
        format.turbo_stream { render_frame_show }
      end
    end
  end

  # DELETE /media/1
  def destroy
    @media.destroy
    respond_to do |format|
      format.html { redirect_to medias_url, notice: t("notice.destroyed", model: Media.lowercase_human_name) }
      format.turbo_stream { render_partial "media_destroy" }
    end
  end

  private

  def render_partial(name)
    render partial: name, locals: { media: @media }
  end

  def render_frame_show
    redirect_to @media
    # render partial: "media", locals: { media: @media }
  end

  def set_error_flash
    flash[:error] = @media.errors.full_messages
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_media
    @media = Media.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def media_params
    params.require(:media).permit(:name, :file, :description, :inline, :owner_type, :owner_id)
  end
end
