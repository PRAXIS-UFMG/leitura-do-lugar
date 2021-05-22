class MediaController < AdminController
  before_action :set_medium, only: [:show, :edit, :update, :destroy]

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
      redirect_to @media, notice: "Media was successfully created."
    else
      render 'form'
    end
  end

  # PATCH/PUT /media/1
  def update
    if @media.update(medium_params)
      redirect_to @media, notice: "Media was successfully updated."
    else
      set_error_flash @media
      render 'form'
    end
  end

  # DELETE /media/1
  def destroy
    @media.destroy
    redirect_to media_index_url, notice: "Media was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_medium
    @media = Media.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def medium_params
    params.require(:media).permit(:name, :description, :description_md, :file)
  end
end
