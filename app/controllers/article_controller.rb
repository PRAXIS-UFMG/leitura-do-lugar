class ArticleController < AdminController
  before_action :set_article, only: [:show, :edit, :update]

  def show

  end

  def edit

  end

  def create

  end

  def update

  end

  private

  def set_article
    @article = Article.find params[:id]
  end

  def article_params
    params.require(:article).permit(:markdown, :rendered, :owner_type, :owner_id)
  end
end
