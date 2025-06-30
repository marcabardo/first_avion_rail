class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
    @comments = @article.comments
    @comment = @article.comments.build
  end

   def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Article posted"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
     @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article,  notice: "Article edited"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, status: :see_other,  notice: "Artcile deleted"
  end

  private
   def set_article
    @article = Article.find(params[:id])
  end
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
