class ContentsController < AdminController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  # GET /admin/contents
  def index
    render CollectionIndexComponent.new Content, Content.all, :'document-add',
                                        name: { header: "w-96" }
  end

  # GET /admin/contents/1
  def show
  end

  # GET /admin/contents/new
  def new
    @content = Content.new
    @content.build_article
    render 'form'
  end

  # GET /admin/contents/1/edit
  def edit
    render "form"
  end

  # POST /admin/contents
  def create
    @content = Content.new(content_params)

    if @content.save
      redirect_to @content, notice: t("notice.created", model: Content.lowercase_human_name)
    else
      render "form"
    end
  end

  # PATCH/PUT /admin/contents/1
  def update
    if @content.update(content_params)
      redirect_to @content, notice: t("notice.updated", model: Content.lowercase_human_name)
    else
      render "form"
    end
  end

  # DELETE /admin/contents/1
  def destroy
    @content.destroy
    redirect_to contents_url, notice: t("notice.destroyed", model: Content.lowercase_human_name)
  end

  private

  def render_form
    render ModelFormComponent.new @content, :name,
                                  name: { as: :enum }, text: {}
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_content
    @content = Content.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def content_params
    params.require(:content).permit(:name, article_attributes: [:markdown, :rendered])
  end
end
