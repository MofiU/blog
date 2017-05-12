class ArticlesController < AdminController
  before_action :set_article, only: [:edit, :update, :destroy, :show]
  before_action :set_tags, only: [:edit, :new]


  def index
    @articles = Article.all
    render :index
  end

  def show
    @comments = @article.comments
    render :show, layout: 'application'
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :meta, :body, :cover_plan, :public, :tag_id, :bootsy_image_gallery_id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def set_tags
    @tags = Tag.all
  end
end
