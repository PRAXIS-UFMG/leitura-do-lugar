class MediaController < AdminController
  before_action :set_media, only: [:show, :inline, :edit, :update, :destroy]
  after_action :set_error_flash, only: [:edit, :update]
  skip_before_action :authenticate!, only: :show

  # GET /media
  def index
    @medias = Media.all
  end

  # GET /media/1
  def show; end

  def inline
    redirect_to url_for(@media.file), status: :see_other
  end

  # GET /media/new
  def new
    @media = Media.new
    render 'form'
  end

  # GET /media/1/edit
  def edit
    render 'form'
  end

  # POST /media
  def create
    @media = Media.new(media_params)
    saved  = @media.save

    if saved && @media.inline?
      head :created, location: public_media_path(@media)
    elsif saved
      redirect_to @media, notice: t("notice.created", model: Media.lowercase_human_name)
    elsif @media.inline?
      head :bad_request, reason: @media.errors.full_messages.join('\n')
    else
      render 'form'
    end
  end

  # PATCH/PUT /media/1
  def update
    if @media.update(media_params)
      redirect_to @media, notice: t("notice.updated", model: Media.lowercase_human_name)
    else
      render 'form'
    end
  end

  # DELETE /media/1
  def destroy
    @media.destroy
    redirect_to media_index_url, notice: t("notice.destroyed", model: Media.lowercase_human_name)
  end

  private

  def set_error_flash
    flash[:error] = @media.errors.full_messages
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_media
    @media = Media.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def media_params
    params.require(:media).permit(:name, :file, :description, :inline)
  end
end
