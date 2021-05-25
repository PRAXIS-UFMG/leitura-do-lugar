class MediaController < AdminController
  before_action :set_media, only: [:show, :edit, :update, :destroy]
  after_action :set_error_flash, only: [:edit, :update]

  # GET /media
  def index
    @medias = Media.all
  end

  # GET /media/1
  def show
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
    @media = Media.new(medium_params)

    if @media.save
      redirect_to @media, notice: t("notice.created", model: Media.lowercase_human_name)
    else
      render 'form'
    end
  end

  # PATCH/PUT /media/1
  def update
    if @media.update(medium_params)
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
  def medium_params
    params.require(:media).permit(:name, :file, article_attributes: [:markdown, :rendered])
  end
end
