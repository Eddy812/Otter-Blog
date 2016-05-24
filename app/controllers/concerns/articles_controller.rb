class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
# ---- /index    
  def new

    @article = Article.new

  end
# ----- /new

  def create

    @article = Article.new(article_params)

    if @article.save

      flash[:notice] = "Article was successfully created"

      redirect_to article_path(@article)

    else

      render 'new'

    end

  end
# ----- /create
  def edit
    @article = Article.find(params[:id])
  end
# ----- /edit
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
# ----- /update
  def show

    @article = Article.find(params[:id])

  end
# ----- /show
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path

  end
# ----- /destory
  private

  def article_params

    params.require(:article).permit(:title, :description)

  end

end
