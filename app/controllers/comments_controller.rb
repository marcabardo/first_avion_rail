class CommentsController < ApplicationController

before_action :set_article
before_action :set_article_comment, only: [:show, :edit, :update, :destroy]

    def index
      @comments = @article.comments
    end

    def show; end

    def edit; end

    def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
      redirect_to article_path(@article), notice: "Comment added"
    end

    def update
      @comment = @article.comments.find(params[:id])
      if @comment.update(comment_params)
        redirect_to article_comment_path(@article, @comment), notice: "Comment edited"
      else 
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article), notice: "Comment Deleted."
    end

  private
    def set_article
      @article = Article.find(params[:article_id])
    end

    def set_article_comment
      @comment = @article.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
