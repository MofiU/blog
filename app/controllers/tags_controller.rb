class TagsController < AdminController
  before_action :set_tag, only: [:edit, :update, :destroy, :show]


  def index
    render :index
  end

  def show
    @articles = @tag.articles
    render :show, layout: 'application'
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_path
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end

end
